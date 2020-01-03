type justify =
  | Center
  | Between
  | Right;

module Styles = {
  open Css;

  let row =
    style([
      display(`flex),
      flex(`num(1.)),
      width(`percent(100.)),
      margin4(
        ~top=`px(0),
        ~right=`px((-1) * Spacing.unit),
        ~left=`px((-1) * Spacing.unit),
        ~bottom=`px(0),
      ),
    ]);

  let justify =
    Belt.Option.mapWithDefault(
      _,
      style([justifyContent(`normal)]),
      fun
      | Center => style([justifyContent(`center)])
      | Between => style([justifyContent(`spaceBetween)])
      | Right => style([justifyContent(`right)]),
    );

  let wrap = style([flexWrap(`wrap)]);
};

[@react.component]
let make = (~justify=?, ~alignItems=?, ~wrap=false, ~children) => {
  <div
    className={Css.merge([
      Styles.row,
      Styles.justify(justify),
      wrap ? Styles.wrap : "",
      // Perhaps the above props should just be a direct map like below...
      Css.style([Css.alignItems(alignItems->Belt.Option.getWithDefault(`center))]),
    ])}>
    children
  </div>;
};
