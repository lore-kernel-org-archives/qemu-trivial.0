Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPx-0008RS-0X
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPt-0008Nu-Ag
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPs-0005ti-NL
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:29 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35185)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPq-0005sZ-Uq; Fri, 06 Oct 2017 19:52:27 -0400
Received: by mail-qk0-x241.google.com with SMTP id w63so11296826qkd.2;
	Fri, 06 Oct 2017 16:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qSsYwGBDhOG0EOPT15FYleiqNzHu/SJyAYtKkbVTKEY=;
	b=FT2YQ7dulQWIibEXnC6NZYi/0/JRzaFkqVrhI+frltOm9YZOMvlnL0YmcaSLg2D0vE
	JOaRaVzM4sIv0gIvkmnKI3SFDZstw06Z5jlq69zhtxMcVAeQEL3aW2ujNwu+R1B9NaGM
	+N3oC7ATs5icHIrg6/gEYwklb6hZTXoezrKxzIGJmLu2n2suCcv3UROuA01amUAomVvp
	z7KOuGo8OVpyOUFYqj5DrMIP3TLlXyLToWy6yEd6RPojs+cbfJO8UejXWFLE+IYobwRk
	/69IkcBXWrxWMoE0MjMm4a8teJa135kditXPZ0OJbfSOPOLf1jJSe5X/ik/wM6DI+uZ/
	VbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qSsYwGBDhOG0EOPT15FYleiqNzHu/SJyAYtKkbVTKEY=;
	b=UxoLGZoJnxmOnpWroFHzBBzzmDUIJbD3d2HyjJ0gerBVjT9ruZz171NZgsoH7rNK8g
	9kkgq1VvpY1g6y2DiC7ofvWSORNp3YdDJW4YJjjXE1lw9ZrR0zz9J86CwPC8MfIKlX1l
	LhSOGxUeHjqNxmvQVEWm+o3b9ekuDgBtvwWyXgas0Dj/8d+kpYXJxJMkif81+Fac1FnQ
	hVFdoiVfSXravKhi0tRyX1EMUZJBKLtuNtFacwaI2a4ZPgP9q5wIu8bcGtNh5MUaQxk9
	dMH+EvWSxO5iuSbslw0o4/0PHR95RlH9g6Z4MUMinuSeoPFD0BGCVmsbFQ5S5saGOReq
	C1ig==
X-Gm-Message-State: AMCzsaUanwrPLEnm3h10/mYv124vx4eDYcqXbvko8GE01I4ir/MNZat7
	W03R0qMNfx3onHwcwgegQvQ=
X-Google-Smtp-Source: AOwi7QDiVGhtKET1F85WjPm5ETPZgqpj/uPGe2lN33hjJS/iLdu75a96YeVDEGblYaiu8lqErQaRxw==
X-Received: by 10.55.197.20 with SMTP id p20mr679920qki.229.1507333946414;
	Fri, 06 Oct 2017 16:52:26 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:28 -0300
Message-Id: <20171006235023.11952-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 33/88] qom: use g_new() family of functions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 23:52:30 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qom/object.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 6a7bd9257b..3273f9c1f0 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -940,7 +940,7 @@ object_property_add(Object *obj, const char *name, const char *type,
         return NULL;
     }
 
-    prop = g_malloc0(sizeof(*prop));
+    prop = g_new0(ObjectProperty, 1);
 
     prop->name = g_strdup(name);
     prop->type = g_strdup(type);
@@ -973,7 +973,7 @@ object_class_property_add(ObjectClass *klass,
         return NULL;
     }
 
-    prop = g_malloc0(sizeof(*prop));
+    prop = g_new0(ObjectProperty, 1);
 
     prop->name = g_strdup(name);
     prop->type = g_strdup(type);
@@ -2281,7 +2281,7 @@ void object_property_add_alias(Object *obj, const char *name,
         prop_type = g_strdup(target_prop->type);
     }
 
-    prop = g_malloc(sizeof(*prop));
+    prop = g_new(AliasProperty, 1);
     prop->target_obj = target_obj;
     prop->target_name = g_strdup(target_name);
 
-- 
2.14.2


