Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSp-0002kY-NP
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSm-0002iF-AH
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSl-0008Vu-83
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:28 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36775)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSh-0008R4-4j; Fri, 06 Oct 2017 19:55:23 -0400
Received: by mail-qk0-x242.google.com with SMTP id z14so12863130qkg.3;
	Fri, 06 Oct 2017 16:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zI2BI8ooaDuOU0ve7WrrbMgxy5q7lqPyUpUsHSIPo2o=;
	b=LMJBrP945Kp2XYozDtEmIBhqmmTn5sATSVfIinEcZLj1Sxaipn5M+gD2Dj4XtXlQxw
	F1Oigun2Oh+bxyu4+saGl9AS6+xo4uvRMMkvN0wgWF5lsM5lPG7SEEU93v5AN52J9zTh
	jd0Z8X8Ssl581YxIvS+3Ppr1vFwzd0fPmB3csJKTPK4lfVJz1cp4YcF5emYMPLVRVm9d
	DErzNmJr+YbZC5W0J+gRKOlgPuD7gOSeeC6q3+jzbfpWl8HZcORBkA+erULc3LLRzsqs
	2FX2FmBzUv2My0e8rEpyXaXPi8Uo5coBdb5x1CMWUJWqUAHqfslX6FO3cs4mj7zAfNSU
	yQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=zI2BI8ooaDuOU0ve7WrrbMgxy5q7lqPyUpUsHSIPo2o=;
	b=AVZlKZoYk+s1BsYJQYoIwL9LUDxpfP4osNn31BWglW9oP2boJcBWq21Fr3zUPXh9gT
	rTNMDdAGRjVVB3wwoSArwC8coeFk1R8pUErmbhS9igV5wGCOOen7gHFC1px/QtJvcn8m
	oRBgYKyPkaEsa/gCpbI88WzwMsF0W29B5p0Y+yaZC8jtEQCjcbGFFKYNSytBd/38s6rI
	8N2HICOCJ7vn2DRaqctaf9lxWrwHGm/AVx1XqJ/bb7LAUSxqzJhSepPivqVpLgyFAJ9e
	JhDumnl9XQ8SGMhBaBVZWqVeX+Gol1Nz/umL5bUwc+WK2OYALjIIxtsYF9iJ/GfMF1+Y
	sI8w==
X-Gm-Message-State: AMCzsaUp8Hor6mDXmsMt7aheD8IDADXKcqa8tgANyBt2OID4gfJHCokx
	0aI7Oji70ixjgLomAN8skpA=
X-Google-Smtp-Source: AOwi7QA0UWLgYwoey5ZGxFS5JpjfuxwpcWKnsMPvUWvowy6e+MXdE0D+aCwkqIQ/IMdSjYtYoUarww==
X-Received: by 10.55.91.199 with SMTP id p190mr679660qkb.291.1507334122594;
	Fri, 06 Oct 2017 16:55:22 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Corey Minyard <cminyard@mvista.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-ppc@nongnu.org
Date: Fri,  6 Oct 2017 20:50:17 -0300
Message-Id: <20171006235023.11952-83-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 82/88] hw/ipmi: use g_new() family of
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:30 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Shouldn't this file be under the PowerPC section of MAINTAINERS?

 hw/ipmi/ipmi_bmc_sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c
index 277c28cb40..a68792a2cb 100644
--- a/hw/ipmi/ipmi_bmc_sim.c
+++ b/hw/ipmi/ipmi_bmc_sim.c
@@ -1073,7 +1073,7 @@ static void send_msg(IPMIBmcSim *ibs,
         return;
     }
 
-    msg = g_malloc(sizeof(*msg));
+    msg = g_new(IPMIRcvBufEntry, 1);
     msg->buf[0] = ((netfn | 1) << 2) | rqLun; /* NetFN, and make a response */
     msg->buf[1] = ipmb_checksum(msg->buf, 1, 0);
     msg->buf[2] = cmd[0]; /* rsSA */
-- 
2.14.2


