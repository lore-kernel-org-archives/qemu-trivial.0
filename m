Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yjmr5-00017i-Ra
	for mharc-qemu-trivial@gnu.org; Sun, 19 Apr 2015 06:53:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr2-00014c-Kb
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmqx-0005gE-R9
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:36 -0400
Received: from mail-wi0-f169.google.com ([209.85.212.169]:37811)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmqx-0005fq-Kt
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:31 -0400
Received: by widdi4 with SMTP id di4so62300600wid.0
	for <qemu-trivial@nongnu.org>; Sun, 19 Apr 2015 03:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EdLF9Z9ufmWSs/0NWIXk77FFy3YrSDTXUUC9j2NDyAQ=;
	b=BA9iLvU8yysUE+vAQHOtN5l8tyrFdZP1qp2lrzVJEzBq3ER13YK3a4VRXTRJNnz6T6
	zIlqA1Y3DOmJGQvQ4HuQJDzWQGfi7iSO9TNa85khmJtggYgwS+p80mZlrTspR9fCU8ZC
	C6H9Jwt0Gp8MbX9ZkfW7ALV4FHyTjBDSdjfJ45OH85dP0Z0MFcfuzJlXGSoC3UehY82m
	ZPWtIseE/waeJJsNu9j1dm2uxqXTSnOwzlLMjghvZTNG9Gd3PZ/aqcctH0dHJPfj5f30
	dTUfwm+FxwcyO4RDySBZrBeomy8gykohi/mcAgNQ+l5V9m7KAeW19RGgRLGMCgkWiBcq
	DayQ==
X-Gm-Message-State: ALoCoQn9d+QgFRkbybjSFaZe6UzbR5GEUNhmgKkA85hLa/4MMwi3JYS8f3z57VDHWOBu0eI3VdNs
X-Received: by 10.195.13.133 with SMTP id ey5mr21932660wjd.3.1429440810234;
	Sun, 19 Apr 2015 03:53:30 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63])
	by mx.google.com with ESMTPSA id fv2sm4350546wjb.6.2015.04.19.03.53.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Apr 2015 03:53:29 -0700 (PDT)
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Date: Sun, 19 Apr 2015 13:53:13 +0300
Message-Id: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
X-Mailer: git-send-email 2.1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.169
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] Windows MSI installation package
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

The patch set has been revised according to reviews

1. options documented in commit messages
2. typos fixed
3. confugure/Makefile melded into one commit

Following changes were introduced since the last review:

1. Makefile launches wilx in quite mode.
2. configure script explicity valudates option setting and complains on mismatch if
MSI package build is enabled without guest agent or MinGW cross-compilation: in the
previous version, absence of guest agent and MinGW made the script to silently drop
MSI package build.


