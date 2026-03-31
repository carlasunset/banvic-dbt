with 
    date_spine as (
        {{ 
            dbt_utils.date_spine(
                datepart = "day",
                start_date = "cast('2000-01-01' as date)",
                end_date = "cast('2030-01-01' as date)"
            )
        }}
    )

    , criar_datas as (
        select 
        row_number() over(order by date_day) as pk_data
        , cast(date_day as date) as dt_data
        , extract(day from date_day) as dia
        , extract(month from date_day) as mes
        , extract(year from date_day) as ano
        , extract(quarter from date_day) as trimestre
        , extract(dow from date_day) as dia_da_semana
        , case 
            when extract(dow from date_day) in (0,6) then true
            else false
        end as is_final_de_semana
        from date_spine
    )

select * from criar_datas