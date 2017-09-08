Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNE3-00078g-UY
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:37:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDz-00076v-2t
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDy-0007LU-BY
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:51 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35108)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDy-0007LG-7S; Fri, 08 Sep 2017 13:37:50 -0400
Received: by mail-qt0-x241.google.com with SMTP id p55so1950723qtc.2;
	Fri, 08 Sep 2017 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=XnPBYB3bEANmkMmcYPE4T+i0YhZm2sxADUzqujV2sig=;
	b=YNUyVOnFxMQhDASrQmnblS/A21PV4BwQE9UILi5OyTyCbE3wUfGfz+5y4d7Z4O8C64
	iKOpf/aX+VrioZwwBuUPsVKUzY1CN7lnRsYMhC1JhV6lZiz5f89u/zUB2GQP+P8X73Wm
	r7Hd2A9E3ZP2BGmooDQziHcq4EDdGajHGlsXMFZW7qTVoJPFutgZqp+0Q2BREi4mn8NP
	VCZi7cLLq4INXiXUwfFgsoElTmTkW2S4BxodwIAd8HzdcNHjzZqApCT/E0wdCpmyH51c
	sPHifAf5e79yvKbuYySwTZu1k1aj+9AiYi2RjoqJqYDttwRLK0SyYMH0pmI6g87ybKrL
	a/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=XnPBYB3bEANmkMmcYPE4T+i0YhZm2sxADUzqujV2sig=;
	b=TAnzuY+7guRJSpjfS69WF/ESUgLryGE6arhY6buGv8jqtrYJk7UjIontSest76TmBx
	gitG1sMSsytEuq6RQVxlScASeCzFq4AsTaWjrKdDgVInEq/m0vgJRW/59E+fcUc1ucSG
	WCsmojoWdx3fVBlhh0RVI8IdYU/JuiBG6RELWTAW7Gc3IvIy/PdR/EWh8AxZd1Bc2/50
	gIr7XnrIFZSFMrIortoBI9pKTGSw8hNL9aYpFn0n5NrCexQCUAlzSjApnRwLBHPW0Bvw
	NCV1+pqK8nd6/YGvHoPAZ7/v/j9HDJeIBeRrDkwUbEZn8pteWY7wcXvJowJrnbXOKv9n
	TQsA==
X-Gm-Message-State: AHPjjUiaSYIIIXZUwgNbzut6Vdcfz3NOonF4xEALBXeUJLmMwSBzaKEO
	dAH/yo+6X2rx7uvnY3JgPw==
X-Google-Smtp-Source: AOwi7QAIj35fcq2ikN0QNPugDxoOY6KrGSRMeQI6wYb4dbHQjWmf9w4r3OuQSiTKEwejI3JegCzU1g==
X-Received: by 10.200.40.27 with SMTP id 27mr5241080qtq.148.1504892269466;
	Fri, 08 Sep 2017 10:37:49 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.37.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:37:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Date: Fri,  8 Sep 2017 14:36:23 -0300
Message-Id: <20170908173632.6711-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 06/15] MAINTAINERS: add missing qcow2 entry
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
X-List-Received-Date: Fri, 08 Sep 2017 17:37:54 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa1620d8a8..39ac5d132a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1851,6 +1851,7 @@ M: Max Reitz <mreitz@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/qcow2*
+F: docs/interop/qcow2.txt
 
 qcow
 M: Kevin Wolf <kwolf@redhat.com>
-- 
2.14.1


