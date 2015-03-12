Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YW5vq-00034t-UI
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 12:25:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YW0Sv-0005SX-6y
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 06:35:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YW0Sp-0000ui-8b
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 06:35:45 -0400
Received: from mail-we0-f176.google.com ([74.125.82.176]:33838)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YW0Sp-0000uX-2z
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 06:35:39 -0400
Received: by wesx3 with SMTP id x3so15367569wes.1
	for <qemu-trivial@nongnu.org>; Thu, 12 Mar 2015 03:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9duYw/Kiq+1OGrilyxyymQrzkJCzL4w2b+G5lw5IgeQ=;
	b=MlsXXdotgIw/Zk1bSlE0VEtXvI1TRymwShXbMaDSe4xwtc2MvAAncXMg8lBwn4XzB2
	pltBtoemr1n7115i/A8LKWvrnG6ByhIORdBK4bAEgZHugQU1EV6QzltauHHZ3xymh0oo
	2q99/pefAKWxRjKWEDNgL82DQqg226KmGK3L9cQQuBwtyxOAXHlksD0GsRyEHidaJoMN
	TVqGhxWLVfundmQgBxVemIFaXQYMDp9OyjNhZwvhyXFWoud1zLMeHe3J5kI/jCIZXBPR
	/UP25rLdZsSn16BNCENp6vVVAad4D8dvy08QG5qkYhcLDqOaFSqiZVyVjSoEAZrIXS1K
	tMOw==
X-Gm-Message-State: ALoCoQnRdPSPv3ZrGOlBFEC0+7SKnKjp94I7u9ckUClC9Q/9OltIcdtg63BfcEEKcL5ldiUI7CPb
X-Received: by 10.194.210.103 with SMTP id mt7mr87119122wjc.103.1426156538515; 
	Thu, 12 Mar 2015 03:35:38 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63]) by mx.google.com with ESMTPSA id
	lx10sm9395596wjb.17.2015.03.12.03.35.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 03:35:37 -0700 (PDT)
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Mar 2015 12:35:28 +0200
Message-Id: <1426156529-31276-1-git-send-email-jhindin@daynix.com>
X-Mailer: git-send-email 2.1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.176
X-Mailman-Approved-At: Thu, 12 Mar 2015 12:25:58 -0400
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] Revised patch for qga-vss.dll linking
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
X-List-Received-Date: Thu, 12 Mar 2015 10:35:47 -0000

I am submitting the revised patch for linking qga-vss.dll with 64-bit MinGW
toolchain.

    Regards,
       Joseph Hindin


