Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPuL0-0000U2-TM
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 09:45:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maxa@catit.be>) id 1WPn4I-0001Vs-QU
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 02:00:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maxa@catit.be>) id 1WPn48-00009x-75
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 02:00:06 -0400
Received: from mail-la0-f52.google.com ([209.85.215.52]:42384)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maxa@catit.be>) id 1WPn48-00009n-0X
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 01:59:56 -0400
Received: by mail-la0-f52.google.com with SMTP id ec20so4350422lab.39
	for <qemu-trivial@nongnu.org>; Mon, 17 Mar 2014 22:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lGcnMrwL97zZRNdZSy/jFFxmHV9YBLFmdoOPjkVTxK4=;
	b=dXuUCHuHJO0zfcSLP6J7aW9+MY+sHKu17gqLxy33Kjj31yvOb/SH3W5djT/7ebHocv
	psRHLkrXJGtalcLRVU3iUUcx9kTqA1r5hL3YPHBOV+6omQEWUAx8lYVJ5vla1pAfsY9J
	7nJoqR0aAb8REPmvfQMqCZrngwL9z6Y3DG7TerJeNfO9XT7ULQPGaThmEYraQz2vYkuX
	snsWB5TD6EMk2PK4lOeayC2V37KO6IzFNA4rjXFDv+i4hXlh8LgNXWiT8X/gMimQe8Hc
	9/ZJnua/0x+Ch7OMdkY1VAmEp5NTlZHrfAQqPbkouaanhtEpeTWFnVwmChNfoTKCSIDZ
	Sm3g==
X-Gm-Message-State: ALoCoQnCdUj99oKeNU7Jrg4K3eEV+dKcEEvuml9iv+JsKMdzeoJKGlXT6jHDUTbTRa83g33ck9jn
X-Received: by 10.112.1.233 with SMTP id 9mr18724371lbp.29.1395122393935;
	Mon, 17 Mar 2014 22:59:53 -0700 (PDT)
Received: from z1.base.vohkarts.com ([31.134.130.233])
	by mx.google.com with ESMTPSA id
	tq9sm14326202lbb.10.2014.03.17.22.59.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Mar 2014 22:59:52 -0700 (PDT)
From: Maria Kustova <maxa@catit.be>
To: qemu-devel@nongnu.org
Date: Tue, 18 Mar 2014 09:59:16 +0400
Message-Id: <1395122359-28890-1-git-send-email-maria.k@catit.be>
X-Mailer: git-send-email 1.8.2.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.52
X-Mailman-Approved-At: Tue, 18 Mar 2014 09:45:48 -0400
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, Maria Kustova <maria.k@catit.be>,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH v2 0/3] Trivial patches
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Mar 2014 06:00:14 -0000

These patches are the part of OPW application.
Two of them update help messages of qemu-io utility.
And last one replaces fprintf() with error_setg() in curl.c

Changes v1 -> v2:
 * Removed trailing "\n" from the error string in error_setg() call

Maria Kustova (3):
  qemu-io-cmds: Fixed typo in example for writev.
  block: Replaced old error handling with error reporting API.
  qemu-io: Extended "--cmd" description in usage text

 block/curl.c   | 2 +-
 qemu-io-cmds.c | 2 +-
 qemu-io.c      | 9 ++++++---
 3 files changed, 8 insertions(+), 5 deletions(-)

-- 
1.8.2.1


