Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dau2b-0002Z4-6H
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 21:26:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2Y-0002W8-Oj
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:26:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2X-00026W-Ju
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:26:06 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:38265)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2S-00023o-SU; Thu, 27 Jul 2017 21:26:00 -0400
Received: by mail-qt0-x244.google.com with SMTP id p3so11595681qtg.5;
	Thu, 27 Jul 2017 18:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FlE5nJZA3eJqYHVZJYO8naC0/H7VpEt5FrcMOSTk6lU=;
	b=pc34haX0wnHHPJrBnNnMCmvU8kDbr5OleswUJX6xP2JXJr9Xc18UZP3pbHJR49zIzg
	7zesYTbQWKFdY3P4bUD72K3reqK4S2maRA42NyFhxsUSu3cgZ1vZVX4fGSe2jyCoaIbu
	W04cyW110TWjIDbBvk1FBn1DgIUG8oqsaw76BIyAoPsWXm3+M5SvKlXEbHckALMpC2Iv
	fNa/h3U8OvDoB6VB7MBJ0Hw9oKmcwyy36Nn7+Tuma9jxnPKeUW4/jlAu+Y5e0L8bOR/w
	cAEI3nuQWMzHci75f0zIJpl6FZfKNBChJnUMBF//PxbJ+WeZz2/d3BAg540315TLu0PA
	oh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=FlE5nJZA3eJqYHVZJYO8naC0/H7VpEt5FrcMOSTk6lU=;
	b=STylcuCvX2SOjHxX3z8J1tPrUYUrM5CdN18JiKXRSyqpRedigxrZkHHrLUrQmZybdf
	c/XcovjSJTpDKG9m8d+LuzUNmqOnL5lm2MJGKEYZ6FkueV+GFPsd0u6CpNbMTfY2NjD2
	VFCT8Av5lhoVlesbV8CD2H7RaJFrXzbGxMfXi296q6OKELxx5/CoSZjh90cb3s0AZxyD
	FCko/LuEpS67ClOwHg6TDsZck8T20lOSkYQlBc8bIEAqVSd5zv8JtJLiejl0wIS4MGZz
	MWg96oZb0VkToKKz9gGFaEpCizjstVLoFBCeQqFYRRrE6UaR7StCS1OXoTQ4Gr0UeDy5
	Hdaw==
X-Gm-Message-State: AIVw113MUEg/9sEfRy8LXh7yapjDnallqgXpsCSDrpT7YxHaCN0GeWbY
	mRx8dDd8o4ZUNw==
X-Received: by 10.200.52.100 with SMTP id v33mr8955382qtb.67.1501205160336;
	Thu, 27 Jul 2017 18:26:00 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	o97sm15010202qte.56.2017.07.27.18.25.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 18:25:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 27 Jul 2017 22:25:37 -0300
Message-Id: <20170728012542.29975-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728012542.29975-1-f4bug@amsat.org>
References: <20170728012542.29975-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH for 2.10 3/8] docs: fix broken paths to
 docs/devel/qapi-code-gen.txt
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
X-List-Received-Date: Fri, 28 Jul 2017 01:26:08 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/devel/writing-qmp-commands.txt | 2 +-
 include/qapi/visitor.h              | 2 +-
 qapi/introspect.json                | 2 +-
 qapi/qapi-util.c                    | 2 +-
 scripts/qapi2texi.py                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/devel/writing-qmp-commands.txt b/docs/devel/writing-qmp-commands.txt
index 69793e320e..4f5b24c0c4 100644
--- a/docs/devel/writing-qmp-commands.txt
+++ b/docs/devel/writing-qmp-commands.txt
@@ -7,7 +7,7 @@ This document doesn't discuss QMP protocol level details, nor does it dive
 into the QAPI framework implementation.
 
 For an in-depth introduction to the QAPI framework, please refer to
-docs/qapi-code-gen.txt. For documentation about the QMP protocol,
+docs/devel/qapi-code-gen.txt. For documentation about the QMP protocol,
 start with docs/interop/qmp-intro.txt.
 
 == Overview ==
diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index fe9faf469f..0f3b8cb459 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -36,7 +36,7 @@
  * QemuOpts, and clone visitors have some implementation limitations;
  * see the documentation for each visitor for more details on what it
  * supports.  Also, see visitor-impl.h for the callback contracts
- * implemented by each visitor, and docs/qapi-code-gen.txt for more
+ * implemented by each visitor, and docs/devel/qapi-code-gen.txt for more
  * about the QAPI code generator.
  *
  * All of the visitors are created via:
diff --git a/qapi/introspect.json b/qapi/introspect.json
index 1dbaef56eb..cf77ff0669 100644
--- a/qapi/introspect.json
+++ b/qapi/introspect.json
@@ -226,7 +226,7 @@
 #
 # @members: the alternate type's members, in no particular order.
 #           The members' wire encoding is distinct, see
-#           docs/qapi-code-gen.txt section Alternate types.
+#           docs/devel/qapi-code-gen.txt section Alternate types.
 #
 # On the wire, this can be any of the members.
 #
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index e28dbd0ac3..46eda7d196 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -40,7 +40,7 @@ int qapi_enum_parse(const char * const lookup[], const char *buf,
  * It may be prefixed by __RFQDN_ (downstream extension), where RFQDN
  * may contain only letters, digits, hyphen and period.
  * The special exception for enumeration names is not implemented.
- * See docs/qapi-code-gen.txt for more on QAPI naming rules.
+ * See docs/devel/qapi-code-gen.txt for more on QAPI naming rules.
  * Keep this consistent with scripts/qapi.py!
  * If @complete, the parse fails unless it consumes @str completely.
  * Return its length on success, -1 on failure.
diff --git a/scripts/qapi2texi.py b/scripts/qapi2texi.py
index 9e015002ef..a317526e51 100755
--- a/scripts/qapi2texi.py
+++ b/scripts/qapi2texi.py
@@ -91,7 +91,7 @@ def texi_format(doc):
         # doesn't.
         #
         # Make sure to update section "Documentation markup" in
-        # docs/qapi-code-gen.txt when fixing this.
+        # docs/devel/qapi-code-gen.txt when fixing this.
         if line.startswith('| '):
             line = EXAMPLE_FMT(code=line[2:])
         elif line.startswith('= '):
-- 
2.13.3


