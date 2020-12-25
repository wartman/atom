import atom.Engine;
import js.Browser;
import atom.Css;
import atom.CssValue;
import atom.CssUnit;

class Main {
  static function main() {
    Css.globalRule({
      body: {
        padding: 'none',
        backgroundColor: 'blue'
      },
      div: {
        padding: Px(10)
      }
    });
    var multiStyle = Css.rule({
      color: 'blue',
      backgroundColor: 'green',
      width: Px(150),
      height: Px(130)
    });
    
    var el = Browser.document.createDivElement();
    Browser.document.body.appendChild(el);
    el.className = Css.atoms({
      width: Px(150),
      height: Px(130),
      backgroundColor: '#cccccc',
      p: {
        padding: [ Px(50), Px(20) ],
        color: 'red'
      }
    });
    el.innerHTML = '<p>Foo!</p>';
    el.addEventListener('click', e -> {
      el.className = Css.atoms({
        width: Px(150),
        height: Px(130),
        backgroundColor: '#bbbbbb'
      }) + ' ' + Css.mediaQuery({ type: Screen, minWidth: Px(900) }, 'width', Px(80));
    });

    var el2 = Browser.document.createDivElement();
    el2.className = multiStyle;
    el2.innerHTML = '<p>Foo!</p>';
    Browser.document.body.appendChild(el2);

    trace(Engine.getInstance().stylesToString());
  }
}