import 'package:flutter/material.dart';
import 'package:tradeable_learn_widget/option_strategy/models/option_strategy_leg.model.dart';
import 'package:tradeable_learn_widget/option_strategy/option_strategy_container.dart';

class OptionStrategyWidget extends StatelessWidget {
  const OptionStrategyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OptionStrategyContainer(
                    spotPrice: 24662,
                    spotPriceDayDelta: 17.70,
                    spotPriceDayDeltaPer: 0.07,
                    onExecute: () {},
                    legs: [
                      OptionLeg(
                        symbol: "NIFTY",
                        strike: 24750,
                        type: PositionType.buy,
                        optionType: OptionType.call,
                        expiry: DateTime.parse("2024-12-19 15:30:00"),
                        quantity: 25,
                        premium: 121.8,
                      ),
                      OptionLeg(
                        symbol: "NIFTY",
                        strike: 24900,
                        type: PositionType.sell,
                        optionType: OptionType.call,
                        expiry: DateTime.parse("2024-12-19 15:30:00"),
                        quantity: 25,
                        premium: 73.35,
                      )
                    ],
                  )));
        },
        child: const Text("Options Strategy"));
  }
}
