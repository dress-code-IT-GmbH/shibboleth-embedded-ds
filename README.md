## Patched version of shibboleth-embedded-ds-1.2.2

### Patch 1: Allow whitelisting with hostname

```
@@ -471,6 +471,9 @@ function IdPSelectUI() {
            if (regexp.test(testString)) {
                return true;
            }
+            if (testString.startsWith(regexp[i])) {
+                return true;
+            }
        }
        return false;
    };
```

### Patch 2: Delay call from idpselect.js to index.html to control the call.


```
@@ -1618,4 +1618,3 @@ function IdPSelectUI() {
    };
  }

- (new IdPSelectUI()).draw(new IdPSelectUIParms());
```


```

  <script src="idpselect.js" type="text/javascript" language="javascript"></script>

+  <script type="text/javascript" language="javascript">
+    (new IdPSelectUI()).draw(new IdPSelectUIParms());
+  </script>
+
  <noscript>
  ```