Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbE1a-00058H-0E
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 18:46:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1W-000569-DA
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1V-0002CC-M2
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:22 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33091)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1S-00028P-C6; Fri, 28 Jul 2017 18:46:18 -0400
Received: by mail-qt0-x242.google.com with SMTP id u19so11301174qtc.0;
	Fri, 28 Jul 2017 15:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iPv9Hs5dmDOXgG4NOdt2zaW0dSwbDYXHue1ZfMv0wdA=;
	b=EH77O09C3qN5MViPX5TK91jFqA2Owr0UmMPtPQNRZLui2cZdPOMShubSXBqsDf8fnC
	fgqtB5CK1/D57bNVpIAABXp7md8UOrucHsk31MXBhvfyFqJmD6C1MERQGUkpA9y2ddhV
	Z1GrM4z8HJXH/aztXM9GaIPHzVubpRvx6JK13kSJGBg/v2LVz3uUYv2CTG0GNlQZoG1f
	mzqkhgwwcksmIrSYJVUsud4Rny1hwLVuQJXQot1N1ne3yXrGu66Ofm2ujATilbYTiujs
	IybwbSrDxRUWCp5JKXrF4crKuUSomr3XjfYy1KJgC3yxRg9wNOB8nFlr1goHGFFShIiy
	81Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=iPv9Hs5dmDOXgG4NOdt2zaW0dSwbDYXHue1ZfMv0wdA=;
	b=HFa2Tx11xoNuFxGC1zRw3Q/hIHS6N1na7+oh+p3rZhlZ1BOpO388wLyb8dAJFb7Rx+
	9R++YnrP8srgwKQBR/a7XwJVSFshlFyHdq+UXR8RqDYARZGByfZ9dE+hsXYoephSDDJ5
	qxnZXhwFlx6qbMKrt/pE2yZmWIzbMtrDc5gSO5NWuIZRvXU5n/ekSiYD8RWvtRBraSUF
	aQ1adZRnwOdG1P70zvWnUa+3RC/0+PBl0ryFuQZciBAZT5d5PELfEvRSc8UVUkqERBxg
	yTAHjPEndzTdNU8F7rcDUlp74QMXpm1w39n+RO5Pzzie+g/PK6eodorasOQB2RDezYsh
	gpPA==
X-Gm-Message-State: AIVw111HqScQDhXXtQFTVxATvrZ0H+gJM1KTjvkPKkVn1btEYx0EI14O
	AQF6k7RZ5rCBkTDmyHQTng==
X-Received: by 10.200.44.212 with SMTP id 20mr13569083qtx.282.1501281977746;
	Fri, 28 Jul 2017 15:46:17 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	m129sm15831970qkc.2.2017.07.28.15.46.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 15:46:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 28 Jul 2017 19:46:01 -0300
Message-Id: <20170728224608.3598-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728224608.3598-1-f4bug@amsat.org>
References: <20170728224608.3598-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v2 for 2.10 1/8] docs: fix broken paths to
 docs/interop dir
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
X-List-Received-Date: Fri, 28 Jul 2017 22:46:23 -0000

From: Cleber Rosa <crosa@redhat.com>

With the move of some docs to docs/interop on d59157e, a couple of
references were not updated.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
[PMD: fixed a typo and another reference of docs/interop/qmp-spec.txt]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 docs/devel/writing-qmp-commands.txt | 2 +-
 qapi-schema.json                    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/devel/writing-qmp-commands.txt b/docs/devel/writing-qmp-commands.txt
index 1e6375495b..69793e320e 100644
--- a/docs/devel/writing-qmp-commands.txt
+++ b/docs/devel/writing-qmp-commands.txt
@@ -8,7 +8,7 @@ into the QAPI framework implementation.
 
 For an in-depth introduction to the QAPI framework, please refer to
 docs/qapi-code-gen.txt. For documentation about the QMP protocol,
-start with docs/qmp-intro.txt.
+start with docs/interop/qmp-intro.txt.
 
 == Overview ==
 
diff --git a/qapi-schema.json b/qapi-schema.json
index c96f0a26f6..802ea53d00 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -23,7 +23,7 @@
 # | -> data issued by the Client
 # | <- Server data response
 #
-# Please, refer to the QMP specification (docs/qmp-spec.txt) for
+# Please, refer to the QMP specification (docs/interop/qmp-spec.txt) for
 # detailed information on the Server command and response formats.
 #
 # = Stability Considerations
@@ -108,7 +108,7 @@
 #
 # Notes: This command is valid exactly when first connecting: it must be
 # issued before any other command will be accepted, and will fail once the
-# monitor is accepting other commands. (see qemu docs/qmp-spec.txt)
+# monitor is accepting other commands. (see qemu docs/interop/qmp-spec.txt)
 #
 # Since: 0.13
 #
-- 
2.13.3


