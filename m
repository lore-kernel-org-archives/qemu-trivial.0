Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yjmr6-00018K-Cn
	for mharc-qemu-trivial@gnu.org; Sun, 19 Apr 2015 06:53:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr3-00015m-Nv
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmqz-0005gg-7M
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:37 -0400
Received: from mail-wi0-f176.google.com ([209.85.212.176]:38579)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmqz-0005gT-0D
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:33 -0400
Received: by wiun10 with SMTP id n10so62301501wiu.1
	for <qemu-trivial@nongnu.org>; Sun, 19 Apr 2015 03:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kWTpj44/9PctYJb0Y0CEcdIEg4rpcfbvH50TaK87PrA=;
	b=FY7S2+lJX0qXPYIdit+zck8LBCsQTkssDupn46ltL/qEUovQ0kYlIAnkCG7t9UA3oj
	zjrq/xCUZZvIN7ZyHUQw5SEYF3UTtR8SSqhNrXZqOjtn49seGynHXy/gRAmwx7oN3dRJ
	q2710bJ+Ab4585Dri565M+NgWJNOWDb+Jslil0P69QAc09VqQLG/jo+yNc+CgQtgUOy5
	dbKU7pAzKUV0MfRkyDWU8Rt/waBx/l5SgH4t7YvExFM4AjhGzg8/v2fnI7K0G0zUeeDg
	Pz0fsa/Y4e43PHribyNYG6QflPM0vmSAYvqOnWGnH90TtYXKr2PPxvkCEuUgCTeXFJxZ
	aIiw==
X-Gm-Message-State: ALoCoQny+o5ouMPViS06Q1gfyGtZ1M8FjIFfy3Eg5hdK6A5zpsh4gWj13DFqRJgipRyrzNvHB/OB
X-Received: by 10.194.203.74 with SMTP id ko10mr21290765wjc.96.1429440812424; 
	Sun, 19 Apr 2015 03:53:32 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63])
	by mx.google.com with ESMTPSA id fv2sm4350546wjb.6.2015.04.19.03.53.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Apr 2015 03:53:31 -0700 (PDT)
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Date: Sun, 19 Apr 2015 13:53:14 +0300
Message-Id: <1429440798-11888-2-git-send-email-jhindin@daynix.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
References: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.176
Cc: qemu-trivial@nongnu.org, Joseph Hindin <jhindin@daynix.com>
Subject: [Qemu-trivial] [PATCH 0/4] Windows MSI installation package
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
X-List-Received-Date: Sun, 19 Apr 2015 10:53:38 -0000

The patches enable creation of MSI installation package for QEMU windows guest agent

Joseph Hindin (4):
  qemu-ga: adding vss-[un]install options
  qemu-ga: debug printout to help troubleshoot installation
  qemu-ga: Introduce Windows MSI script
  qemu-ga: Building Windows MSI installation with configure/Makefile

 Makefile                  |  19 +++++-
 configure                 |  67 +++++++++++++++++++-
 qga/channel-win32.c       |   2 +-
 qga/commands-win32.c      |   1 +
 qga/installer/qemu-ga.wxs | 156 ++++++++++++++++++++++++++++++++++++++++++++++
 qga/main.c                |  10 ++-
 6 files changed, 250 insertions(+), 5 deletions(-)
 create mode 100644 qga/installer/qemu-ga.wxs

-- 
2.1.0


