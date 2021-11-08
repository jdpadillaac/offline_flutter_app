part of '../home_page.dart';

class _ProductItem extends StatelessWidget {
  const _ProductItem(
    this._product, {
    Key? key,
  }) : super(key: key);

  final Product _product;

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsive(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: AppColors.background,
            offset: Offset(0.6, 0.6),
            spreadRadius: 5,
          ),
        ],
      ),
      margin: EdgeInsets.only(
        top: responsive.height(16),
        left: responsive.width(16),
        right: responsive.width(16),
      ),
      padding: EdgeInsets.symmetric(
        vertical: responsive.height(8),
        horizontal: responsive.width(16),
      ),
      child: Row(
        children: [
          _ProductImage(_product.image),
          SizedBox(
            width: responsive.width(16),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _product.title,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: responsive.height(16),
                ),
                Text(
                  _product.description.length > 50
                      ? _product.description.substring(0, 50) + '...'
                      : _product.description,
                ),
                SizedBox(
                  height: responsive.height(4),
                ),
                Text(
                  ' \$ ${_product.price.toString()}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: const [
              Icon(
                Icons.shopping_basket,
                color: AppColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage(this._value, {Key? key}) : super(key: key);

  final String _value;

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsive(context);

    return _value.isNotEmpty
        ? Image.network(
            _value,
            width: responsive.width(130),
            height: responsive.height(130),
          )
        : Image.asset(
            'assets/default.jpeg',
            width: responsive.width(130),
            height: responsive.height(130),
          );
  }
}
