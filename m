Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fmNm0-00063L-1H
	for mharc-qemu-trivial@gnu.org; Sun, 05 Aug 2018 14:29:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNlw-00060y-Q7
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:28:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNlv-000597-2h
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:28:56 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:40729)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pavel.zbitskiy@gmail.com>)
	id 1fmNlo-00051n-8i; Sun, 05 Aug 2018 14:28:48 -0400
Received: by mail-qt0-x244.google.com with SMTP id h4-v6so11492771qtj.7;
	Sun, 05 Aug 2018 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xVs61bJBnIwWy8fAh9ZXoThBCw+QPxKw+Y9z2+s8j6I=;
	b=IRUusLGKspcbfN5x9UkJhERUkClU1hROgKY3TZdev7Q69VUXrpFA9G55DPislnwiiL
	RRc3Xbhej41BVOXQuR89e9C7Ji7klzfkPsqx8nvPqGzU92ptGIjhh1s951kIdoMxz4O6
	ZuZO7Bt1F9YD4nJdSRnpihE46ShznStveeDkfdz0nxPtuc/vWtdMYqy7+Y5NQCYn+8GZ
	coHxSYQmLUsqGY8frPC2a4l8CHyUGvQCJ7Zb45E9oYLEUxS/SwkQHoQ9NXLTywdqiBtE
	8an3X52+gz24skO9dLTi6Fyoks4nZ/Vg6eZfuwDGW09BA3Jgc5hmOnBQ7q2o902/xzof
	PqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xVs61bJBnIwWy8fAh9ZXoThBCw+QPxKw+Y9z2+s8j6I=;
	b=sWFlnk7Cp44O1pEXozd8v7k1YhsZPp4Vw5fS+a3rI/Yirk0UW3ySaFB08Pjqr8+9E2
	aaSuY+iBGzveeZuAybKyVhwRWPngENos49sBNpU7vCLw16gITjJ9p6C2fpyPix6GN4TB
	CC3wx4qGgNNnUFD3jZ9dSajz7UFFltqsxfEE0yRsgymS/JrNC6uggWQhHT1VqX2gEwuG
	6s3ZUuwja4c1Y60YSE9Xt4cSeAIB/lBmbCXJf9ALx70T7KRjpPOe2CN7AAtTFhEar86G
	G3uZ5MHYzDtHPui2A1KpTv8rCBD8cKPi+dvi6+Fc3QIg4ksf648SyrF6PK8ckzwcfsAT
	FO8w==
X-Gm-Message-State: AOUpUlH25St9D65GpVG1MhlzopsWy4DFVJKHx2ekLMzi5WmQ6cTzlaEg
	A6moLx1Ot5R+QU3/J8SlQqwhKtZQPqc=
X-Google-Smtp-Source: AAOMgpfE7uDkTyHQslUTsBRNgSbm6tcbSVWS9rcEIPFc738iIjRUslEz6zemaxcKjntpJi8QBkWtng==
X-Received: by 2002:a0c:86b3:: with SMTP id
	48-v6mr10363711qvf.64.1533493727592; 
	Sun, 05 Aug 2018 11:28:47 -0700 (PDT)
Received: from WAL-L-PZ01.rocketsoftware.com
	(inet-64-112-177-9.bos.netblazr.com. [64.112.177.9])
	by smtp.gmail.com with ESMTPSA id
	j86-v6sm12842786qkh.60.2018.08.05.11.28.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Aug 2018 11:28:47 -0700 (PDT)
From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
Date: Sun,  5 Aug 2018 14:28:25 -0400
Message-Id: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 0/6] Some improvements in z/Arch instructions
 support
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
X-List-Received-Date: Sun, 05 Aug 2018 18:28:58 -0000

Add BAL, BALR, CVB instructions
Fix few bugs in PACK, CSST

Pavel Zbitskiy (6):
  target/s390x: add BAL and BALR instructions
  target/s390x: fix CSST decoding and runtime alignment check
  target/s390x: fix ipm polluting irrelevant bits
  target/s390x: add EX support for TRT and TRTR
  target/s390x: fix PACK reading 1 byte less and writing 1 byte more
  target/s390x: implement CVB, CVBY and CVBG

 target/s390x/helper.h      |  2 ++
 target/s390x/insn-data.def |  7 ++++++
 target/s390x/int_helper.c  | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 target/s390x/mem_helper.c  | 24 +++++++++++++++----
 target/s390x/translate.c   | 52 +++++++++++++++++++++++++++++++++++++----
 5 files changed, 135 insertions(+), 8 deletions(-)

-- 
2.16.2.windows.1


