Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dau2T-0002T3-M7
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 21:26:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2Q-0002QC-8k
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:25:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2P-000214-9I
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:25:58 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34794)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2N-0001z4-2B; Thu, 27 Jul 2017 21:25:55 -0400
Received: by mail-qk0-x244.google.com with SMTP id q66so19914653qki.1;
	Thu, 27 Jul 2017 18:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tK5uVYcv3U12lrwTzL5EMI+aDGPAEZcBXkS+kIeU6Qk=;
	b=nXAEQd/rsnBTYr/bQC593Cmpcuhfhe0WN72ZaNCdPqa6Jv7heqe78jN6nayPMggRjk
	KnrxMsoRGk8R5qmruSIO+BOZt/Elbq5mxGoTCcxB6wgdaoZl8ci3kZ+XEt6r/vgIoRcY
	zmjTvQSCkYvomDbYEQUYh33KiCWL0Q/0d+Bs8fgxOflhfYSeO7t8txIeEKNcSOLlSrLR
	GfD9f/qF1BBL5CdesPtEsGe8Jwg0AuOYwYFg4o9TaWdN1fGCUm1ukAd9rMY2v4dwIx/5
	6lofvpvuBXb+QqjqQrA+2kURwc0vvAYMW+p7ElX2SZ3/UH9phEt9EyjbLE9206OII84U
	uGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=tK5uVYcv3U12lrwTzL5EMI+aDGPAEZcBXkS+kIeU6Qk=;
	b=n2oHFQugpF4/ew4cHplHduDXT+1ot3ebZgF7zhd3HOSr0xSoI55RKHz692VwxIV4ct
	dOu4B6aIljmSbejB5o8DRdNNdQ527MVdXN9ciZt9WXnShH6U4ULZgKr1EjdL+cUoHLTM
	1bt7/tiZx9uEFcK3alI1ZNq+0dZxyk12bS063q8xJxLeWwE+uJxO0Z5C6+lgkBzi08V4
	3uAxORYuBOR/cs76zJzpSXcGN/kJSdwHwIcOo87hStRbTiuPibVweasXVeAI74E5H8SA
	oFpsCslsWsncRSG6qlwsf2k6lEZvqwwIRGQxLKVjXmc4TbhmF/hL4atQBtUvgaCGD5Kq
	aP5w==
X-Gm-Message-State: AIVw111BDdO/XxYGZJtEWWoFlDHbrKICP5EVASoSUOtVobblBjIhsmRw
	OLjuX0W8L0G+NQ==
X-Received: by 10.55.25.41 with SMTP id k41mr8461977qkh.354.1501205154552;
	Thu, 27 Jul 2017 18:25:54 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	o97sm15010202qte.56.2017.07.27.18.25.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 18:25:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 27 Jul 2017 22:25:35 -0300
Message-Id: <20170728012542.29975-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728012542.29975-1-f4bug@amsat.org>
References: <20170728012542.29975-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH for 2.10 1/8] docs: fix broken paths to
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
X-List-Received-Date: Fri, 28 Jul 2017 01:25:59 -0000

From: Cleber Rosa <crosa@redhat.com>

With the move of some docs to docs/interop on d59157e, a couple of
references where not updated.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
[PMD: fixed another reference in docs/interop/qmp-spec.txt]
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
index dcc12c83a9..5fda5fa4d2 100644
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


