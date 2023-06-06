# Patched version of shibboleth-embedded-ds-1.2.2

### Change 1: Allow whitelisting with non-regex in this.returnWhiteList like:

```
    this.returnWhiteList = [ "https://www.example.org/Shibboleth.sso/Login" ];
```

### Change 2: Delay call from idpselect.js to index.html to control the call.


index.html:
```
  <script src="idpselect.js" type="text/javascript" language="javascript"></script>

+  <script type="text/javascript" language="javascript">
+    (new IdPSelectUI()).draw(new IdPSelectUIParms());
+  </script>
+
  <noscript>

```