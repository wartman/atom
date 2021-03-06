import atom.Engine;
import js.Browser;
import atom.Css;
import atom.CssValue;
import atom.CssUnit;

class Main {
  static final width = atom.CssUnit.Px(150);

  static function main() {
    Css.injectGlobalCss({
      body: {
        padding: 'none',
        backgroundColor: 'blue'
      },
      div: {
        padding: Px(10)
      }
    });
    var boxStyle = Css.rule({
      color: 'blue',
      backgroundColor: 'green',
      width: width,
      height: Px(130),
      '@media screen and (min-width: 50px)': {
        width: Px(20)
      }
    });
    
    var el = Browser.document.createDivElement();
    Browser.document.body.appendChild(el);
    el.className = Css.atoms({
      width: Px(150),
      height: Px(130),
      backgroundColor: '#cccccc',
      ':hover': {
        backgroundColor: '#555555',
      },
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
      }).with(
        Css.mediaQueryAtoms({ 
          minWidth: Px(900), 
          type: 'screen'
        }, { width: Px(80) })
      );
    });

    var el2 = Browser.document.createDivElement();
    el2.className = boxStyle;
    el2.innerHTML = '<p>Foo!</p>';
    Browser.document.body.appendChild(el2);

    trace(Engine.getInstance().stylesToString());
  }
}
