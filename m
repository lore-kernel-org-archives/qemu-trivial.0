Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xxwfd-0004WH-67
	for mharc-qemu-trivial@gnu.org; Mon, 08 Dec 2014 06:40:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XxwfV-0004J1-4U
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 06:40:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XxwfO-0000wa-6p
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 06:39:57 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:11651)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XxwfC-0000rf-HZ; Mon, 08 Dec 2014 06:39:39 -0500
Received: from 172.24.2.119 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AYI99033; Mon, 08 Dec 2014 19:39:26 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml422-hub.china.huawei.com
	(10.82.67.161) with Microsoft SMTP Server id 14.3.158.1; Mon, 8 Dec 2014
	19:39:16 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 8 Dec 2014 19:39:05 +0800
Message-ID: <1418038745-6728-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.54858DEF.01B5, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c56c88ea0ce94b94b46fce45dfd1b8c1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH] keymaps: correct keymaps.c following Qemu
	coding style
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Dec 2014 11:40:03 -0000

From: Gonglei <arei.gonglei@huawei.com>

It's hard to read because of the confused coding
style in this file. Let's correct it following Qemu
coding style.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 ui/keymaps.c | 196 ++++++++++++++++++++++++++++++++---------------------------
 1 file changed, 108 insertions(+), 88 deletions(-)

diff --git a/ui/keymaps.c b/ui/keymaps.c
index 80d658d..49410ae 100644
--- a/ui/keymaps.c
+++ b/ui/keymaps.c
@@ -26,18 +26,20 @@
 #include "sysemu/sysemu.h"
 
 static int get_keysym(const name2keysym_t *table,
-		      const char *name)
+                      const char *name)
 {
     const name2keysym_t *p;
     for(p = table; p->name != NULL; p++) {
-        if (!strcmp(p->name, name))
+        if (!strcmp(p->name, name)) {
             return p->keysym;
+        }
     }
     if (name[0] == 'U' && strlen(name) == 5) { /* try unicode Uxxxx */
         char *end;
         int ret = (int)strtoul(name + 1, &end, 16);
-        if (*end == '\0' && ret > 0)
-          return ret;
+        if (*end == '\0' && ret > 0) {
+            return ret;
+        }
     }
     return 0;
 }
@@ -46,19 +48,20 @@ static int get_keysym(const name2keysym_t *table,
 static void add_to_key_range(struct key_range **krp, int code) {
     struct key_range *kr;
     for (kr = *krp; kr; kr = kr->next) {
-	if (code >= kr->start && code <= kr->end)
-	    break;
-	if (code == kr->start - 1) {
-	    kr->start--;
-	    break;
-	}
-	if (code == kr->end + 1) {
-	    kr->end++;
-	    break;
-	}
+        if (code >= kr->start && code <= kr->end) {
+            break;
+        }
+        if (code == kr->start - 1) {
+            kr->start--;
+            break;
+        }
+        if (code == kr->end + 1) {
+            kr->end++;
+            break;
+        }
     }
     if (kr == NULL) {
-	kr = g_malloc0(sizeof(*kr));
+        kr = g_malloc0(sizeof(*kr));
         kr->start = kr->end = code;
         kr->next = *krp;
         *krp = kr;
@@ -67,30 +70,30 @@ static void add_to_key_range(struct key_range **krp, int code) {
 
 static void add_keysym(char *line, int keysym, int keycode, kbd_layout_t *k) {
     if (keysym < MAX_NORMAL_KEYCODE) {
-	//fprintf(stderr,"Setting keysym %s (%d) to %d\n",line,keysym,keycode);
-	k->keysym2keycode[keysym] = keycode;
+        /* fprintf(stderr,"Setting keysym %s (%d) to %d\n",
+                   line, keysym, keycode); */
+        k->keysym2keycode[keysym] = keycode;
     } else {
-	if (k->extra_count >= MAX_EXTRA_COUNT) {
-	    fprintf(stderr,
-		    "Warning: Could not assign keysym %s (0x%x) because of memory constraints.\n",
-		    line, keysym);
-	} else {
+        if (k->extra_count >= MAX_EXTRA_COUNT) {
+            fprintf(stderr, "Warning: Could not assign keysym %s (0x%x)"
+                    " because of memory constraints.\n", line, keysym);
+        } else {
 #if 0
-	    fprintf(stderr, "Setting %d: %d,%d\n",
-		    k->extra_count, keysym, keycode);
+            fprintf(stderr, "Setting %d: %d,%d\n",
+                    k->extra_count, keysym, keycode);
 #endif
-	    k->keysym2keycode_extra[k->extra_count].
-		keysym = keysym;
-	    k->keysym2keycode_extra[k->extra_count].
-		keycode = keycode;
-	    k->extra_count++;
-	}
+            k->keysym2keycode_extra[k->extra_count].
+            keysym = keysym;
+            k->keysym2keycode_extra[k->extra_count].
+            keycode = keycode;
+            k->extra_count++;
+        }
     }
 }
 
 static kbd_layout_t *parse_keyboard_layout(const name2keysym_t *table,
-					   const char *language,
-					   kbd_layout_t * k)
+                                           const char *language,
+                                           kbd_layout_t *k)
 {
     FILE *f;
     char * filename;
@@ -101,69 +104,78 @@ static kbd_layout_t *parse_keyboard_layout(const name2keysym_t *table,
     f = filename ? fopen(filename, "r") : NULL;
     g_free(filename);
     if (!f) {
-	fprintf(stderr,
-		"Could not read keymap file: '%s'\n", language);
-	return NULL;
+        fprintf(stderr, "Could not read keymap file: '%s'\n", language);
+        return NULL;
     }
 
-    if (!k)
-	k = g_malloc0(sizeof(kbd_layout_t));
+    if (!k) {
+        k = g_malloc0(sizeof(kbd_layout_t));
+    }
 
     for(;;) {
-	if (fgets(line, 1024, f) == NULL)
+        if (fgets(line, 1024, f) == NULL) {
             break;
+        }
         len = strlen(line);
-        if (len > 0 && line[len - 1] == '\n')
+        if (len > 0 && line[len - 1] == '\n') {
             line[len - 1] = '\0';
-        if (line[0] == '#')
-	    continue;
-	if (!strncmp(line, "map ", 4))
-	    continue;
-	if (!strncmp(line, "include ", 8)) {
-	    parse_keyboard_layout(table, line + 8, k);
+        }
+        if (line[0] == '#') {
+            continue;
+        }
+        if (!strncmp(line, "map ", 4)) {
+            continue;
+        }
+        if (!strncmp(line, "include ", 8)) {
+            parse_keyboard_layout(table, line + 8, k);
         } else {
-	    char *end_of_keysym = line;
-	    while (*end_of_keysym != 0 && *end_of_keysym != ' ')
-		end_of_keysym++;
-	    if (*end_of_keysym) {
-		int keysym;
-		*end_of_keysym = 0;
-		keysym = get_keysym(table, line);
-		if (keysym == 0) {
-                    //		    fprintf(stderr, "Warning: unknown keysym %s\n", line);
-		} else {
-		    const char *rest = end_of_keysym + 1;
+            char *end_of_keysym = line;
+            while (*end_of_keysym != 0 && *end_of_keysym != ' ') {
+                end_of_keysym++;
+            }
+            if (*end_of_keysym) {
+                int keysym;
+                *end_of_keysym = 0;
+                keysym = get_keysym(table, line);
+                if (keysym == 0) {
+                    /* fprintf(stderr, "Warning: unknown keysym %s\n", line);*/
+                } else {
+                    const char *rest = end_of_keysym + 1;
                     int keycode = strtol(rest, NULL, 0);
 
                     if (strstr(rest, "numlock")) {
-			add_to_key_range(&k->keypad_range, keycode);
-			add_to_key_range(&k->numlock_range, keysym);
-			//fprintf(stderr, "keypad keysym %04x keycode %d\n", keysym, keycode);
-		    }
+                        add_to_key_range(&k->keypad_range, keycode);
+                        add_to_key_range(&k->numlock_range, keysym);
+                        /* fprintf(stderr, "keypad keysym %04x keycode %d\n",
+                                   keysym, keycode); */
+                    }
 
                     if (strstr(rest, "shift")) {
-			keycode |= SCANCODE_SHIFT;
+                        keycode |= SCANCODE_SHIFT;
                     }
                     if (strstr(rest, "altgr")) {
-			keycode |= SCANCODE_ALTGR;
+                        keycode |= SCANCODE_ALTGR;
                     }
                     if (strstr(rest, "ctrl")) {
-			keycode |= SCANCODE_CTRL;
+                        keycode |= SCANCODE_CTRL;
                     }
 
-		    add_keysym(line, keysym, keycode, k);
+                    add_keysym(line, keysym, keycode, k);
 
                     if (strstr(rest, "addupper")) {
-			char *c;
-			for (c = line; *c; c++)
-			    *c = qemu_toupper(*c);
-			keysym = get_keysym(table, line);
-			if (keysym)
-			    add_keysym(line, keysym, keycode | SCANCODE_SHIFT, k);
-		    }
-		}
-	    }
-	}
+                        char *c;
+                        for (c = line; *c; c++) {
+                            *c = qemu_toupper(*c);
+                        }
+                        keysym = get_keysym(table, line);
+                        if (keysym) {
+                            add_keysym(line, keysym,
+                                       keycode | SCANCODE_SHIFT, k);
+                        }
+                    }
+                }
+            }
+        }
     }
     fclose(f);
     return k;
@@ -180,19 +192,23 @@ int keysym2scancode(void *kbd_layout, int keysym)
 {
     kbd_layout_t *k = kbd_layout;
     if (keysym < MAX_NORMAL_KEYCODE) {
-	if (k->keysym2keycode[keysym] == 0)
-	    fprintf(stderr, "Warning: no scancode found for keysym %d\n",
-		    keysym);
-	return k->keysym2keycode[keysym];
+        if (k->keysym2keycode[keysym] == 0) {
+            fprintf(stderr, "Warning: no scancode found for keysym %d\n",
+                    keysym);
+        }
+        return k->keysym2keycode[keysym];
     } else {
-	int i;
+        int i;
 #ifdef XK_ISO_Left_Tab
-	if (keysym == XK_ISO_Left_Tab)
-	    keysym = XK_Tab;
+        if (keysym == XK_ISO_Left_Tab) {
+            keysym = XK_Tab;
+        }
 #endif
-	for (i = 0; i < k->extra_count; i++)
-	    if (k->keysym2keycode_extra[i].keysym == keysym)
-		return k->keysym2keycode_extra[i].keycode;
+        for (i = 0; i < k->extra_count; i++) {
+            if (k->keysym2keycode_extra[i].keysym == keysym) {
+                return k->keysym2keycode_extra[i].keycode;
+            }
+        }
     }
     return 0;
 }
@@ -202,9 +218,11 @@ int keycode_is_keypad(void *kbd_layout, int keycode)
     kbd_layout_t *k = kbd_layout;
     struct key_range *kr;
 
-    for (kr = k->keypad_range; kr; kr = kr->next)
-        if (keycode >= kr->start && keycode <= kr->end)
+    for (kr = k->keypad_range; kr; kr = kr->next) {
+        if (keycode >= kr->start && keycode <= kr->end) {
             return 1;
+        }
+    }
     return 0;
 }
 
@@ -213,8 +231,10 @@ int keysym_is_numlock(void *kbd_layout, int keysym)
     kbd_layout_t *k = kbd_layout;
     struct key_range *kr;
 
-    for (kr = k->numlock_range; kr; kr = kr->next)
-        if (keysym >= kr->start && keysym <= kr->end)
+    for (kr = k->numlock_range; kr; kr = kr->next) {
+        if (keysym >= kr->start && keysym <= kr->end) {
             return 1;
+        }
+    }
     return 0;
 }
-- 
1.7.12.4



