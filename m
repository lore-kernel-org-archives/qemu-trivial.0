Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UN3bE-0007z5-M5
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2013 11:58:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UN3bB-0007sv-S7
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2013 11:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UN3b7-0007eS-H1
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2013 11:58:13 -0400
Received: from mail-ea0-x236.google.com ([2a00:1450:4013:c01::236]:51553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UN3b0-0007dE-Gp; Tue, 02 Apr 2013 11:58:02 -0400
Received: by mail-ea0-f182.google.com with SMTP id q15so305852ead.41
	for <multiple recipients>; Tue, 02 Apr 2013 08:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=2GMkI+l9USt2y0VbX3PoYhvHWYa9lTvOvYk+QhU7LAo=;
	b=W0oSZNDlvA6NSc+U64hB0tUfHtYTl+AqrkSUg40RsuxDGzXG6FGT+QOuPlQAqjVkC8
	g6wdN3+F5Lu/RF36pA2M1ItUAdpcu0ULQMUBlM+Al/JH1A4nf0vrrz9NhgbZku6Kyg33
	RrkzGjMc/Zd/WQIgNmVv8ozZpf92DYlVX1gNv17/SrqlEIs51jiSD5UREyoRnn/Hx7C5
	YUB27un8PkQ6sa7nJdeGM+zW/10y0bthKbjKd4FZa2+7cUMzAT+UpkkmYC+YzTvk1IvA
	uqBinJqS63QTvYwSpiwzr8fC22Blfba6eljAEeLHRuy+s137EuDCpUszFKkG3dng1Fe/
	Nl3w==
X-Received: by 10.14.223.69 with SMTP id u45mr11121671eep.23.1364918281516;
	Tue, 02 Apr 2013 08:58:01 -0700 (PDT)
Received: from playground.lan (93-34-176-20.ip50.fastwebnet.it. [93.34.176.20])
	by mx.google.com with ESMTPS id d47sm3507684eem.9.2013.04.02.08.57.59
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 08:58:00 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Apr 2013 17:57:56 +0200
Message-Id: <1364918276-11866-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.1.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::236
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: remove unset variables
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
X-List-Received-Date: Tue, 02 Apr 2013 15:58:15 -0000

These variables have not been set for a long time.  Do not
include them in config-host.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configure b/configure
index ec51b0b..54e9017 100755
--- a/configure
+++ b/configure
@@ -3916,8 +3916,6 @@ else
   echo "AUTOCONF_HOST := "                             >> $config_host_mak
 fi
 echo "LDFLAGS=$LDFLAGS" >> $config_host_mak
-echo "ARLIBS_BEGIN=$arlibs_begin" >> $config_host_mak
-echo "ARLIBS_END=$arlibs_end" >> $config_host_mak
 echo "LIBS+=$LIBS" >> $config_host_mak
 echo "LIBS_TOOLS+=$libs_tools" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
-- 
1.8.1.4


