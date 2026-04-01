with
    fato_transacoes as (
        select *
        from {{ ref('int_fato_transacoes') }}
    )

select *
from fato_transacoes