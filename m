Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBSu-0006TI-SU
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSr-0006Oy-IT
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSq-0003nW-N7
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:45 -0400
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:37389)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSn-0003mF-Og; Sun, 10 Jun 2018 21:17:41 -0400
Received: by mail-qt0-x235.google.com with SMTP id a18-v6so1599619qtj.4;
	Sun, 10 Jun 2018 18:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Fo75brl2XHGtbdIkF47v1gxebmoB9oStoH2EffNAyiI=;
	b=S+IKyfDhfZ8mOPRD2qVsEb8rnZZm0mrynpt5MfVBjwuyih8l2tJYDiXX2G+Azet/K+
	abn9CnFhKXVjn1+N8uMp6fI5PG2u1tqEw3GDo4sTBUj15THhKFGpNJw/qvSE8FPOMzCx
	X1FZMHO0n5F1f2OSKanl/n6ut6cxiSFh93cpeeMObfQJ87vEj7m79TCpk8Lmv7syuPll
	ORAUyYQrYuVvSgdOV8+mXVfMZGxxR2eDoPnx9hghTNIpJ8sz2dsVUl5TJaGj0FyKR6qO
	9b7EzrQy0LHVk52BI8TWsrtbZgyao8irqxlMPdwbFkGE1gVeboxo+tRkCiNpQDhHKPlX
	XUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Fo75brl2XHGtbdIkF47v1gxebmoB9oStoH2EffNAyiI=;
	b=D/v0z9CAhXgaGgt08WYSMBB9G+r2O/3zqKF5eNrSrq4SLSHv5uAKv9wb4balUSX3rd
	FN7/n1UZUXfXh+rzoUVUjN/jbvmarggfx55NjaL0B/wnfWoTgEt3d32aRH0QhUn6CQK7
	Vt77n51ixQ2ytUJWcCu7sq0R6XcqbpIjgRgIAbf7jEYGAtPKTGG08WcTjwFKHufXJ2va
	g14yDLndcBertmf25bDf22bxNm1uGbk6bL4nHb9Ss/30WBzqLz8KRAm9RFZ0LS3STqc4
	14kCvzw9uTXQPnIoS0gCSoGb6ckLh6vC4k/T1rRFeBaa7nSRId9iLaEaErYX7r/70wPX
	sTnw==
X-Gm-Message-State: APt69E1/xlH0Z5d/AWMd+dcAItbru5pQ8VfnweaDvZoCfGeCbKq77x+3
	aAKxveT3oWXYJh75uE8GlS0=
X-Google-Smtp-Source: ADUXVKIAb2TaHXU2wnELGf128d6DofEHN9YRk/1rjlPanKA3vNjNINCkagCxBdKvQaGvda5b9kqoxw==
X-Received: by 2002:ac8:26c3:: with SMTP id
	3-v6mr14371614qtp.151.1528679861328; 
	Sun, 10 Jun 2018 18:17:41 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.17.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:17:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun, 10 Jun 2018 22:15:01 -0300
Message-Id: <20180611011501.10235-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: [Qemu-trivial] [PATCH v4 40/40] cutils: Do not include
 "qemu/units.h" directly
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
X-List-Received-Date: Mon, 11 Jun 2018 01:17:46 -0000

All files using "qemu/units.h" definitions already include it directly,
we can now remove it from "qemu/cutils.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
---
 include/qemu/cutils.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 056e6629bb..cdb0f0db75 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -2,7 +2,6 @@
 #define QEMU_CUTILS_H
 
 #include "qemu/fprintf-fn.h"
-#include "qemu/units.h"
 
 /**
  * pstrcpy:
-- 
2.17.1


