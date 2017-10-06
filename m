Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSu-0002pP-D8
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSs-0002nN-DI
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSp-00007I-J5
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:34 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33120)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSn-00005n-I4; Fri, 06 Oct 2017 19:55:29 -0400
Received: by mail-qk0-x242.google.com with SMTP id z12so9702355qkb.0;
	Fri, 06 Oct 2017 16:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kOG8ryxXrQud/PCmZtEGVImSDwBRP+LfkGt7dShvAMQ=;
	b=heXu39vrBfgUyW5q6QznqO7R7pfxbn7YNla2UsmytGC2Myjlsjpokhq4XGKatDjOjV
	opeyYxYTAgQcL8BM10IVl4+jo7abIE40TbgZdqh09Gy8Lcc+5OfEP9gGo6m1EIKDzJM6
	aGm7hUAN1lK1+550DCvd8K/TKtt84kD9yOiFrSzogTFqX5RLYQbSTDtijr7HVlDVt+QH
	3j8PhJjX76yzTWWIXRNmfOfLa51USocd1Ly98sS6HQ2E8YoRF/st3iLG5Upj5SyNMURo
	+oRlLQQXirfCKTQbDqekPV/+Qn4y1qFLdq6DGNTLJnuLFfDFRSJfa0GxwXe/R5hZgxHZ
	9x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kOG8ryxXrQud/PCmZtEGVImSDwBRP+LfkGt7dShvAMQ=;
	b=ZxAdoT/5/xho5zWoe5SwRHbiPSr1i0voz6ZPd71r57ix6s1J8aKOWWDUctuuSJAHRm
	QNakT6C62uBjSY/tifks+TTtFmM1fUcnG+74ISgbrks0QRO/jduaN8wtDNmMo5kURa4t
	uEOsyksgpeqriQh2QLdW/E5I2dtnL3LGWNxDTzeGdjgU5NemCBYNiLaJmyPGZ+99Cv2S
	BpgNLEkcIukeYDetfdUlkisqI1aDYdrmHuonKYMjqS1jCjR6w1SiTuU2On/e/PX2q4gl
	4n9iYGvpuRVIKJbYJNMn4rr3yLto8u0yStfmPpDzkGB9gNZ8rIvRch6J8tt+nDBP0Xzx
	RKBg==
X-Gm-Message-State: AMCzsaXpg0iv2T9TxKTinHobGPKEMeGOFMX7KtZhTmvciShsvu6rjXbN
	s0JG0Njjv5dQkHMD6MlzJEo=
X-Google-Smtp-Source: AOwi7QCzHr04GohSPF7I3w3El0Rb/4i2xziDnze703kXLiTIzl5/L4S7zQtGT+W26iaw/xMo1OKNWw==
X-Received: by 10.55.162.7 with SMTP id l7mr771285qke.74.1507334128872;
	Fri, 06 Oct 2017 16:55:28 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Dmitry Fleytman <dmitry@daynix.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:19 -0300
Message-Id: <20171006235023.11952-85-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 84/88] hw/scsi: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:35 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/scsi/vmw_pvscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index d8079158ac..24d0306ede 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -616,7 +616,7 @@ pvscsi_queue_pending_descriptor(PVSCSIState *s, SCSIDevice **d,
     PVSCSIRequest *pvscsi_req;
     uint8_t lun;
 
-    pvscsi_req = g_malloc0(sizeof(*pvscsi_req));
+    pvscsi_req = g_new0(PVSCSIRequest, 1);
     pvscsi_req->dev = s;
     pvscsi_req->req = *descr;
     pvscsi_req->cmp.context = pvscsi_req->req.context;
-- 
2.14.2


