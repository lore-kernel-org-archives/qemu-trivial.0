Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6yCy-0006XF-BA
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 08:21:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCu-0006Tr-Qj
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 08:21:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCt-0007FC-U4
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 08:21:20 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:50403)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCm-0007Aw-QU; Tue, 24 Oct 2017 08:21:12 -0400
Received: by mail-qt0-x243.google.com with SMTP id d9so23300519qtd.7;
	Tue, 24 Oct 2017 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RuxqJoY8o+MvoJrBKpmNAkcYjUHQKm+mlOY5DYZt1zA=;
	b=ccZ38MdOamCFDlc2C8dPP6puKaJIgqO8jit6ClyxfoWu0A75SFQprEvhq0DeNvdY/H
	qDKfNNrlmnPnO3E2bz0tjZ08zuZOh5NjbZ21QhTpZYzMeg9+iSLVy7k92fJuyzAOxSIc
	M0Z3QztD+c6ntUmZClHbsxCS5lxrvns/Kxj31DJagquqwwJCykD3mPbqVoDcRn1aHjy3
	XdXdv26phRTky0sZ4tZ4HXd2ojuJrmXlo6GKkpV/ymUDA3UEEIChI+SeHKgpBCJue+0p
	Yekk0nK0/bU3wev1ivkt1PxRwo622Z0NIGgFuh8iTuLwW4ld3+Gbn+VOFAtSYPd7p82+
	s82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=RuxqJoY8o+MvoJrBKpmNAkcYjUHQKm+mlOY5DYZt1zA=;
	b=QSj755IC8CvOEoUlzMorAO8TxUpIlMyRdo06ir6FNs4plJrLFe7GmL/pABvtPHcBdx
	OX+IlmRxHBJMT9njn3b9Z/Rjs1iq/JHmbXUcb6hL9O5mXWCmYj9tWaGCpV7lxX1xMPO1
	7ChT82/Z+YwDAdzT1WJDcXV2PAMID3lIUTcAoYqlX5R2QxJcI9271Qj+4A/d4tcUQhbY
	Q1saHPcMEU5pYxGTBSNomST+/QOMAnVXB0e1K9gQ6imlfAPdjKtyyY8jS7AWXAR9k/mK
	iNoXtKzzUsaea+5JaoSgUtLsmjeNJ6hTAPU93SJ3d8q8e+k4GXTNE40wup9k0Pfmx//l
	D7WQ==
X-Gm-Message-State: AMCzsaVVqmoFEg/dLdiRRCTC67xzUZ0606SlqwE3DFclQq3IH7NzJsTo
	MMXEfrEGeCZpY7Eu0cawwds=
X-Google-Smtp-Source: ABhQp+S85YG2htHqdS8JiLOl/ZPnJ/vf3HnN4LGFhAYRLoYbxsveA6m8hYdcrri0b3+vBRiZW69KsQ==
X-Received: by 10.200.49.92 with SMTP id h28mr25547284qtb.340.1508847672279;
	Tue, 24 Oct 2017 05:21:12 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id n76sm103983qkn.85.2017.10.24.05.21.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Oct 2017 05:21:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Amarnath Valluri <amarnath.valluri@intel.com>,
	Juan Quintela <quintela@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Xu <peterx@redhat.com>
Date: Tue, 24 Oct 2017 09:20:45 -0300
Message-Id: <20171024122045.30072-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc1
In-Reply-To: <20171024122045.30072-1-f4bug@amsat.org>
References: <20171024122045.30072-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2 4/4] vl: remove unnecessary #ifdef
 CONFIG_TPM
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
X-List-Received-Date: Tue, 24 Oct 2017 12:21:21 -0000

a stub is now provided.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Richard W.M. Jones <rjones@redhat.com>
---
 vl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/vl.c b/vl.c
index 0723835bbf..ec299099ff 100644
--- a/vl.c
+++ b/vl.c
@@ -4624,11 +4624,9 @@ int main(int argc, char **argv, char **envp)
         exit(1);
     }
 
-#ifdef CONFIG_TPM
     if (tpm_init() < 0) {
         exit(1);
     }
-#endif
 
     /* init the bluetooth world */
     if (foreach_device_config(DEV_BT, bt_parse))
-- 
2.15.0.rc1


