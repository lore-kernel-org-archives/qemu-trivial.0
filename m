Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCqlb-0007hP-GX
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jun 2016 12:00:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bCqlZ-0007eT-0x
	for qemu-trivial@nongnu.org; Tue, 14 Jun 2016 12:00:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bCqlX-0003Ma-0q
	for qemu-trivial@nongnu.org; Tue, 14 Jun 2016 12:00:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56569)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bCqlP-0003Ib-Ad; Tue, 14 Jun 2016 12:00:27 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 169F27F09A;
	Tue, 14 Jun 2016 16:00:26 +0000 (UTC)
Received: from localhost (vpn1-7-151.gru2.redhat.com [10.97.7.151])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5EG0OFM000571; Tue, 14 Jun 2016 12:00:25 -0400
Date: Tue, 14 Jun 2016 13:00:23 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20160614160023.GQ18662@thinpad.lan.raisama.net>
References: <1465919097-21453-1-git-send-email-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465919097-21453-1-git-send-email-berrange@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 14 Jun 2016 16:00:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] win32: don't run subprocess tests on
 Mingw32 platform
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
X-List-Received-Date: Tue, 14 Jun 2016 16:00:38 -0000

On Tue, Jun 14, 2016 at 04:44:57PM +0100, Daniel P. Berrange wrote:
> The g_test_trap_subprocess() method does not work on the
> Mingw32 platform, causing the test-qdev-global-props
> test case to abort
> 
> (test-logging.exe:230): GLib-ERROR **: g_test_trap_subprocess()
> failed: Failed to execute helper program (No such file or directory)
> 
> This failure was introduced a while ago in
> 
>   commit 2177801a4899bf29108b3d471417a5b4d701ec29
>   Author: Eduardo Habkost <ehabkost@redhat.com>
>   Date:   Fri Aug 8 16:03:27 2014 -0300
> 
>     test-qdev-global-props: Run tests on subprocess
> 
> Modify the configure time check to avoid enabling this feature
> on Mingw, rather than trying to rewrite the test to avoid this
> feature.
> 
[...]
> -if test "$glib_subprocess" = "yes" ; then
> +if test "$glib_subprocess" = "yes" && test "$mingw32" != "yes" ; then
>    echo "CONFIG_HAS_GLIB_SUBPROCESS_TESTS=y" >> $config_host_mak
>  fi

I would do the following instead, just in case we have extra code
looking at $glib_subprocess one day.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
diff --git a/configure b/configure
index 8c2f90b..642a80b 100755
--- a/configure
+++ b/configure
@@ -2996,7 +2996,7 @@ fi
 
 # g_test_trap_subprocess added in 2.38. Used by some tests.
 glib_subprocess=yes
-if ! $pkg_config --atleast-version=2.38 glib-2.0; then
+if test "$mingw32" = "yes" || ! $pkg_config --atleast-version=2.38 glib-2.0; then
     glib_subprocess=no
 fi
 

-- 
Eduardo

