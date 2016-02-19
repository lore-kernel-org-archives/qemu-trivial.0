Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWmpM-0008L1-C4
	for mharc-qemu-trivial@gnu.org; Fri, 19 Feb 2016 10:18:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aWmpF-0008C2-31
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 10:18:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aWmpE-0004na-Aw
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 10:18:33 -0500
Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241]:35173)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1aWmp8-0004ki-2w; Fri, 19 Feb 2016 10:18:26 -0500
Received: by mail-pa0-x241.google.com with SMTP id fl4so3543524pad.2;
	Fri, 19 Feb 2016 07:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=e5L8Q8RqB03HvC5s/YKHlcnQck+h2HgU+eJmtmiieB0=;
	b=nwHMoU1fBpl7raWVR6tM7xsFgheTVCdGEIkCyz0yqZ/pmPRgsc3yuajapxsbDa9oLA
	ybb4x8aWu0ShzaVUD5TmAbO+1spt0j/rUExoo6jStOIN5+8++U33Tg6FyZ5kSYQmWmBm
	yh1ZycKCghL6yUagGewKdhyYDmqAq+8oUtdVACT1D589s2M1/EfGj0SXsFBdewXKv5Xt
	q6uyPIQrTgaJpBRMeRP/6xlWG4+vjJWVjWLKi86AaouwN2tjEnMWYUQ4SHDsUy0YmSvd
	PFIdgRMmdRd60mfJ6b34dNCpMVn/K1MrItIPTeCkdFRBhlOvbB0AJVdUzjeWzqwwNm+S
	C31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e5L8Q8RqB03HvC5s/YKHlcnQck+h2HgU+eJmtmiieB0=;
	b=f6aQAOL87PP7KdcsDCVakmaqU28iumS1ABOACi+EAWEkhrJoB8GlRspoWsrYq2qQ4H
	Wbs8TfPsaDQ3SYOf4I5nFUBTaYYH+2sMY06K0E6NOD+yF6wFgigzaHjtDxt6xHTh0YZs
	l8q8IFc7peYBvdpbE7t6Va2G0Cj0yq6c2g9s88IDf/MGvN7aVKORbFggolF2x8oOdHyY
	2xZqXr982kLm4OtwINGBbqu1IkN0gj3hGDwF4SkHw8m8jbQFGzQnMpspuOWB8sJ9s45A
	tG38fBSVN1rFtnOecfNJgdidDGQrM2BMzroQw1D+cEPv94yhnGW8X93QpRtZAOeomMmK
	Q3ZQ==
X-Gm-Message-State: AG10YOToBiKGgEY+UO0qZPw9+WPqu8zxx3NYzZE6YlA0vZaFlvm74Aq0KN/eN46i6XWtuw==
X-Received: by 10.67.6.10 with SMTP id cq10mr18874831pad.120.1455895104541;
	Fri, 19 Feb 2016 07:18:24 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	y15sm18596269pfi.16.2016.02.19.07.18.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 07:18:24 -0800 (PST)
From: Wei Yang <richard.weiyang@gmail.com>
To: 
Date: Fri, 19 Feb 2016 15:18:09 +0000
Message-Id: <1455895091-7589-1-git-send-email-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::241
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [Qemu-trivial] [PATCH 0/2] use PCI_MSIX_FLAGS on retrieving the
	MSIX entries
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
X-List-Received-Date: Fri, 19 Feb 2016 15:18:39 -0000

These two patches replace the PCI_CAP_FLAGS with PCI_MSIX_FLAGS on retrieving
the MSIX entries. The change is the same, while I put them in two patches for
different author to review.

Wei Yang (2):
  vfio/pci: use PCI_MSIX_FLAGS on retrieving the MSIX entries
  s390x/pci: use PCI_MSIX_FLAGS on retrieving the MSIX entries

 hw/s390x/s390-pci-bus.c |    2 +-
 hw/vfio/pci.c           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5


