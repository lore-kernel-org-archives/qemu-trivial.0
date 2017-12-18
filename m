Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQxz2-0001tT-Ef
	for mharc-qemu-trivial@gnu.org; Mon, 18 Dec 2017 11:09:40 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1eQx8j-0007TI-Gl
	for qemu-trivial@nongnu.org; Mon, 18 Dec 2017 10:15:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1eQx8T-0003Np-Ji
	for qemu-trivial@nongnu.org; Mon, 18 Dec 2017 10:15:37 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:33073)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <dmitry@daynix.com>) id 1eQx8T-0003MU-67
	for qemu-trivial@nongnu.org; Mon, 18 Dec 2017 10:15:21 -0500
Received: by mail-wm0-x244.google.com with SMTP id g130so8010937wme.0
	for <qemu-trivial@nongnu.org>; Mon, 18 Dec 2017 07:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=daynix-com.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=IMxAxx9Bq4FnsOfAR1QvAWMwDf2zcd2LJiTz10kKWl8=;
	b=AKTa0dfNlvFr4fVrpDVxzQAo/wF1wKDcVDzCO/j9w6FiNTh7pZ7Qem7TSGEi0grnzP
	PQzC20gKYLOD4wwW5icsanbR4+4C733IvTd57ToEGJFTeZVDwqHCi/ANmCs2Umwar53M
	TWH6eB1jV9oOwzOBQQVOgD4gXVDb/IDW3xyg0yy0yasZ0XnGbN2CXxisaumWhj+0Ymk9
	DasFA1po1Gxc6auvO8jWO2jmjz5+Oai+TPiTJWrMOT5w9KlHd6RfyHU6W4IkRkhTxCM5
	bcui/iEerW92HtKB388i8XK/EgUDe1Xu+piwfyz2aL7BtNViiJnZnf+ZqrQ1vrZAx5NP
	lYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=IMxAxx9Bq4FnsOfAR1QvAWMwDf2zcd2LJiTz10kKWl8=;
	b=fSkh90Ndawx5EQypZQQkkzqcPYv4b+Dqhdf7Z7qPfHYvbFUMqpsAOqcEuV2wcG5zMZ
	pvvmpzM49m9iDgHKwJAjFenrm2Y57mCfT8ZS88VbITls5wjq336D9K2nqZupKZVC/qTb
	zvvT/6/WU8VsQUbrFVhuFIvAF/U3kOoFfQkx3/uHv3dRD50n0N6a1vJoZjIZLkEvUfM7
	Se8uJ7x95uStblEg3Io1ChX2Zx6Al/Jzcn/op84Jd7bVtCxF8OzSPkcDru11EQ+7exMd
	aMFJUnRG+8VAdhhSBrjVGhGok+l0DesSJGZoKZ7u7b9R1JZnyuKBz2qWgONG8tIYmrVl
	V8GQ==
X-Gm-Message-State: AKGB3mKRpGp27NI8Cm6ZmVphu9g0T5Hjj/1NCaPL47+lNvzUhjKxfh+h
	1LOKJyfYF2d78lIqJQa96cGGIbGbtr4=
X-Google-Smtp-Source: ACJfBosPxCkuln8VLFMp2WQJhel3JT1FOjAuuANzS7I+JtZ9e+p3vPthlADugljPrQrAg12qYEkC1Q==
X-Received: by 10.28.138.142 with SMTP id m136mr15330wmd.40.1513610119712;
	Mon, 18 Dec 2017 07:15:19 -0800 (PST)
Received: from dmitry-linux.local ([141.226.29.227])
	by smtp.gmail.com with ESMTPSA id
	g92sm18475931wrd.72.2017.12.18.07.15.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Dec 2017 07:15:18 -0800 (PST)
Sender: Dmitry Fleytman <dmitry@daynix.com>
From: Dmitry Fleytman <dmitry.fleytman@gmail.com>
To: qemu-trivial@nongnu.org
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Date: Mon, 18 Dec 2017 17:15:10 +0200
Message-Id: <20171218151510.2901-1-dmitry.fleytman@gmail.com>
X-Mailer: git-send-email 2.14.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
X-Mailman-Approved-At: Mon, 18 Dec 2017 11:09:38 -0500
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Update e-mail address
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
X-List-Received-Date: Mon, 18 Dec 2017 15:15:43 -0000

Updating MAINTAINERS with my current e-mail address.

Signed-off-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 45e2e2009b..d51273e656 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1145,7 +1145,7 @@ F: hw/scsi/mfi.h
 F: tests/megasas-test.c
 
 Network packet abstractions
-M: Dmitry Fleytman <dmitry@daynix.com>
+M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
 S: Maintained
 F: include/net/eth.h
 F: net/eth.c
@@ -1153,7 +1153,7 @@ F: hw/net/net_rx_pkt*
 F: hw/net/net_tx_pkt*
 
 Vmware
-M: Dmitry Fleytman <dmitry@daynix.com>
+M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
 S: Maintained
 F: hw/net/vmxnet*
 F: hw/scsi/vmw_pvscsi*
@@ -1174,12 +1174,12 @@ F: hw/mem/nvdimm.c
 F: include/hw/mem/nvdimm.h
 
 e1000x
-M: Dmitry Fleytman <dmitry@daynix.com>
+M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
 S: Maintained
 F: hw/net/e1000x*
 
 e1000e
-M: Dmitry Fleytman <dmitry@daynix.com>
+M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
 S: Maintained
 F: hw/net/e1000e*
 
-- 
2.14.1


