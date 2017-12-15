Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePghq-0001Ym-6p
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:30:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghl-0001UE-39
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghk-0002xm-AI
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:33 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36597)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghi-0002pO-4w; Thu, 14 Dec 2017 22:30:30 -0500
Received: by mail-qk0-x244.google.com with SMTP id 8so8860162qkj.3;
	Thu, 14 Dec 2017 19:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=enLrjQQBjgwDP+cJGo5RN0FqEQm4LE4jWo16/m5Ge1g=;
	b=bRmFueanVpHo97NtJVm8PQ1Y/lHsHfiyzFAGAJYFDE1RuvPhluhLWlOaBtT4c2p+On
	Rd43ODUKdcd/d1seQDf+9gx6/Qmz3RbDPh4kiSLBuLUTg35h9txecdjZxhDp34VTV0+/
	j/BoLmebABJ194+OQUXweL1/PKSDrpuPvP8K1eHTFmDlKvDSW2fOg5y+H1GWRJt7FDUC
	aglbjJfmCeOAYuN+1/0aJFjkiSp7ECOts/JZg+eqWWRIBM2uhlJENo452iLH0Kgfscby
	WEYziCfXNlFz8mk2vv6KQcCi8dBKqMmuvRk64jlZfQAJ2ewFRLYqD/TGIsep1i2cJzQ8
	cbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=enLrjQQBjgwDP+cJGo5RN0FqEQm4LE4jWo16/m5Ge1g=;
	b=c9ZgGtB7Fz6VB9OQ6cH8LtjWFf+g0HZIA/9/a4oZuh54bCzUXee0cqIXEKDNRNkTpD
	QhlmqJTQ8ERnEARyvO3GVLSOkL6N7aYFx+V2FkPWYa1VVCrxGsRfIwdO/UhMGNOQScHJ
	NNyxTD+jyThoDUkSGB6+igt5AiESYG7v6ySFDmCfrelpGAaAzJ0Gtj1NTm/w+fs2CqIH
	A7YYViJXK2qmv6uEA4YQFUroxt7OMlI5Dkg5szTehxgu7z+yWvldTP2stcfPojyrN1xk
	W+gvvC7CChgocn6/uCI5W7FFpGI/rX/95azhYkn0IryqL3txhwgckdsY3fuwGfCWkMD7
	vMNQ==
X-Gm-Message-State: AKGB3mIXKUMygVeEl3Nihy0KX5dRHq39kNa24aa5N7QKCyNivhBUg8Dv
	9zCnZSaxsKHdeEQU2JW38aU=
X-Google-Smtp-Source: ACJfBouY6AdSegg8b5KRTBL1cr9UnASM7qRmUquqHXpwZG/ultVacVWEzGZ3RrX924f4uOD3YDmJpw==
X-Received: by 10.55.99.5 with SMTP id x5mr19603345qkb.258.1513308629630;
	Thu, 14 Dec 2017 19:30:29 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.30.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:30:29 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:29:34 -0300
Message-Id: <20171215033015.738-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v4 02/43] MAINTAINERS: add an entry for the
 i82374 (southbridge)
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
X-List-Received-Date: Fri, 15 Dec 2017 03:30:36 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8582c7d6b5..eb1646fbfe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -733,6 +733,7 @@ F: hw/ppc/prep_systemio.c
 F: hw/ppc/rs6000_mc.c
 F: hw/pci-host/prep.[hc]
 F: hw/isa/pc87312.[hc]
+F: hw/dma/i82374.c
 F: pc-bios/ppc_rom.bin
 
 sPAPR
-- 
2.15.1


