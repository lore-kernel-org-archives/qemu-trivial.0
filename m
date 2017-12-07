Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eMqqL-0005fm-PS
	for mharc-qemu-trivial@gnu.org; Thu, 07 Dec 2017 02:43:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lepton@google.com>) id 1eMq7X-0005oh-6A
	for qemu-trivial@nongnu.org; Thu, 07 Dec 2017 01:57:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lepton@google.com>) id 1eMq7W-0007HH-75
	for qemu-trivial@nongnu.org; Thu, 07 Dec 2017 01:57:23 -0500
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244]:45560)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <lepton@google.com>) id 1eMq7W-0007GM-1Z
	for qemu-trivial@nongnu.org; Thu, 07 Dec 2017 01:57:22 -0500
Received: by mail-it0-x244.google.com with SMTP id z6so12395009iti.4
	for <qemu-trivial@nongnu.org>; Wed, 06 Dec 2017 22:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Z6MjrmP65oE9QYIzT8FBsioiLUXhs0ZDCfK4EkNVVgY=;
	b=FTzq4YYggJFKRdSkU4bEEgXv0AeKLfuHzLr6l/pOEuYONjFVQ4fEAQGjY9PyWsiuTP
	qzxr/b/beqZLyjW6L/J0nbkq9aFtkDUeTB2kR5Niwo+vOmK7Y5yW9YW/MJYGxsaaneoB
	FmDocMk9XA8WZFN6l/PI16qPcYIPT30UM8xGapRsyXVLXQ3JMwejYqyR8cjt30W992SW
	ENMynvHbCGfQukwtIZuvslaq70QLWpFBO+53StAHuS1Rr0kE7tDI0qFSRpIflbkqcVtS
	dOuZOk6dD+VgUmAjy/GQvBoscMcYbUY674fVVa+Deu2euBOsWPX+AD2jNkn9vZfusP7q
	0nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z6MjrmP65oE9QYIzT8FBsioiLUXhs0ZDCfK4EkNVVgY=;
	b=t++Qjk3zv94H2J6xVHEWji04r9x+gSJY6/Br0qsjG52YsiJTPGNTsDGr86Oz/yDoWd
	H9AteY84vFke0Xb6MugS3I0dfuqRi8sGbu4vwHBZPNz8TRR5QFc5XgG4BbT1lreoyJBJ
	tjk9Ge3A3uGbjeBBSRCkiRJNpJFNyK/uHtgYXXyMrVBzvpwmhRVFXAhC8z5TTwpVxqEn
	MClo+4c83Pz2d2gYuABcGj4z/YKfvhFOqzXcZa+tW9oGTQBZPgcxea9VhGuMu3bY9hJX
	IPSD5gNKjI4l/cqmT/GFfzF2eOsxFjQuHCS7/eCuO9SBJ4c4cPvI2pgU7VHhFsRkFd29
	WRyA==
X-Gm-Message-State: AJaThX5UAbFgzU7wrbid6frdx2DJDwSDumWP7540GqZTp+fH3uUuu80V
	KSbWDyplEpjlJy6DFKEpXIQixg==
X-Google-Smtp-Source: AGs4zMZT4BRCq2tVNAXxGqGaOe5ukaM8S6+nbKNMaPl5CwTXesNKnzs6JiGuUZI4S3jfPxF8vD2DOg==
X-Received: by 10.107.205.69 with SMTP id d66mr39098371iog.254.1512629840283; 
	Wed, 06 Dec 2017 22:57:20 -0800 (PST)
Received: from paxos.mtv.corp.google.com
	([2620:0:1000:1611:5546:7876:68e0:7001])
	by smtp.gmail.com with ESMTPSA id
	i133sm7165420itf.1.2017.12.06.22.57.18
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Dec 2017 22:57:18 -0800 (PST)
From: Tao Wu <lepton@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, mjt@tls.msk.ru,
	laurent@vivier.eu, Tao Wu <lepton@google.com>
Date: Wed,  6 Dec 2017 22:56:39 -0800
Message-Id: <20171207065639.164900-1-lepton@google.com>
X-Mailer: git-send-email 2.15.1.424.g9478a66081-goog
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::244
X-Mailman-Approved-At: Thu, 07 Dec 2017 02:43:37 -0500
Subject: [Qemu-trivial] [PATCH] hw/input/hid: Add support for several keys.
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
X-List-Received-Date: Thu, 07 Dec 2017 06:57:24 -0000

Add support for these keys: audiomute volumedown volumeup power.
Tested with "sendkey" command in monitor and verify the behavior
in guest OS.

Signed-off-by: Tao Wu <lepton@google.com>
---
 hw/input/hid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/input/hid.c b/hw/input/hid.c
index 0d049ff61c..aa4fb826fd 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -57,14 +57,14 @@ static const uint8_t hid_usage_keys[0x100] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x58, 0xe4, 0x00, 0x00,
-    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-    0x00, 0x00, 0x00, 0x00, 0x00, 0x54, 0x00, 0x46,
+    0x7f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x81, 0x00,
+    0x80, 0x00, 0x00, 0x00, 0x00, 0x54, 0x00, 0x46,
     0xe6, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x48, 0x4a,
     0x52, 0x4b, 0x00, 0x50, 0x00, 0x4f, 0x00, 0x4d,
     0x51, 0x4e, 0x49, 0x4c, 0x00, 0x00, 0x00, 0x00,
-    0x00, 0x00, 0x00, 0xe3, 0xe7, 0x65, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0xe3, 0xe7, 0x65, 0x66, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-- 
2.15.1.424.g9478a66081-goog


