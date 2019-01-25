Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmyPh-0008WQ-M6
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 05:08:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1gmyPe-0008VB-Ob
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 05:08:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1gmyPe-0002gC-3D
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 05:08:38 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1gmyKl-0006jY-JK; Fri, 25 Jan 2019 05:03:35 -0500
Received: by mail-wr1-x441.google.com with SMTP id r10so9588208wrs.10;
	Fri, 25 Jan 2019 02:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=HztPIwNC6EFdAYNqUZuJty32nSi1pRB1z0fRArWKoc0=;
	b=lmhyaRUCvwcKv58fpR2VdZ6YsaFsFFD4hwaqOo7Ca7xbCxwHQOa1RI10hl4caygS6p
	9jpa5KaPBSGTNrWlt1EyLyVXZiDilMZb0jU1U97oTooHKZRwLEZA3LfbTabBFCrHIoDi
	jLk9D7NiLL/pG9ufTn+YvIoUPF2ekxpW0QXxtkYp47yfAD6EtMOOG1Bl7JYOpcP27JkX
	JpnsVqKym7zH571E0q9jvUrHWQgAwQ6Dw90v/ALDvWLBOOrVOtbxjlDAEJhcF7c4qlXG
	0G5EW4Ww+EfNvj21h1NqWdmnKwgvyLtije8Mnd0FwyCcNukfbX2xkssp3w40TwPe5OWK
	wSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=HztPIwNC6EFdAYNqUZuJty32nSi1pRB1z0fRArWKoc0=;
	b=KUDghB0iB+xMLUUR9pb6msDNl+evhyWAdy1S8TB5cVY41fauVr9zyRcjdZD5s3mmyL
	JzX8fHyVpHrP0d5VP4WSnfl0uzyaiTPjGne0V62M0hsiMl6kebGJs+Gsm4sjVZv7a+6w
	+1wVZ5UqdY9mKevg0O8O1P/rINBQahjpqZOCfeO3O3eOuZ6BXORsk+Je/C34AoiAh3ll
	rcOazWSXxQTEUhQaRrJWnZmj8FXFB0SdQDHkG6e6G9h6jzpfEqflE5R6WEZhW8mHBLGT
	BdD9FYRqMAAGmgcsiNh3tzxPDcV4Ud28qal9yV5xC+oKT7JgL3EeDKcUCagI95SKY9vy
	oufQ==
X-Gm-Message-State: AJcUukeQRP3UQQrdK2c1kf9t499xIWQ8RWhKjIFdTUHAYzOjd5DskFep
	NCg/BiTbIAQ9kQu0pcMrfoh1iZn3
X-Google-Smtp-Source: ALg8bN5hLJIaROWbthqCmaWVSzfNGJjzqZShSNAs4khRs4iRvIq8a6kQ+ZMQlINDdK2Yw1lIA9aTBg==
X-Received: by 2002:adf:a50c:: with SMTP id i12mr10228660wrb.220.1548410603640;
	Fri, 25 Jan 2019 02:03:23 -0800 (PST)
Received: from 640k.lan ([93.56.166.5]) by smtp.gmail.com with ESMTPSA id
	d16sm87033768wru.52.2019.01.25.02.03.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 02:03:23 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 25 Jan 2019 11:03:22 +0100
Message-Id: <1548410602-16008-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-trivial] [PATCH] decodetree: re.fullmatch was added in 3.4
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
X-List-Received-Date: Fri, 25 Jan 2019 10:08:39 -0000

Python 3 versions earlier than 3.4 do not have it, use the
same workaround that is in place for 3.0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/decodetree.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 0bc73b5..e342d27 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -204,7 +204,7 @@ def output(*args):
         output_fd.write(a)
 
 
-if sys.version_info >= (3, 0):
+if sys.version_info >= (3, 4):
     re_fullmatch = re.fullmatch
 else:
     def re_fullmatch(pat, str):
-- 
1.8.3.1


