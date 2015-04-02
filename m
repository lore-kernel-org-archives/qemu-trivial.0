Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YdVcq-0007Te-MI
	for mharc-qemu-trivial@gnu.org; Wed, 01 Apr 2015 23:17:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YdVck-0007Ju-Hd
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 23:16:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YdVcg-0007ru-FV
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 23:16:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1YdVcW-0007qo-9w; Wed, 01 Apr 2015 23:16:40 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t323GbKQ010948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 1 Apr 2015 23:16:38 -0400
Received: from localhost (vpn1-6-114.pek2.redhat.com [10.72.6.114])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t323Gac9022014; Wed, 1 Apr 2015 23:16:36 -0400
Date: Thu, 2 Apr 2015 11:16:35 +0800
From: Fam Zheng <famz@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20150402031634.GB15412@fam-t430.nay.redhat.com>
References: <1427911118-21905-1-git-send-email-emaste@freebsd.org>
	<551C3CB7.2030308@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <551C3CB7.2030308@weilnetz.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use $(MAKE) for recursive
	make
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
X-List-Received-Date: Thu, 02 Apr 2015 03:16:58 -0000

On Wed, 04/01 20:45, Stefan Weil wrote:
> Am 01.04.2015 um 19:58 schrieb Ed Maste:
> >On BSDs "make" is typically BSD make, while "gmake" is GNU make.
> >
> >Signed-off-by: Ed Maste <emaste@freebsd.org>
> >---
> >  Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/Makefile b/Makefile
> >index 88bce56..ee40397 100644
> >--- a/Makefile
> >+++ b/Makefile
> >@@ -331,8 +331,8 @@ distclean: clean
> >  	rm -rf $$d || exit 1 ; \
> >          done
> >  	rm -Rf .sdk
> >-	if test -f pixman/config.log; then make -C pixman distclean; fi
> >-	if test -f dtc/version_gen.h; then make $(DTC_MAKE_ARGS) clean; fi
> >+	if test -f pixman/config.log; then $(MAKE) -C pixman distclean; fi
> >+	if test -f dtc/version_gen.h; then $(MAKE) $(DTC_MAKE_ARGS) clean; fi
> >  KEYMAPS=da     en-gb  et  fr     fr-ch  is  lt  modifiers  no  pt-br  sv \
> >  ar      de     en-us  fi  fr-be  hr     it  lv  nl         pl  ru     th \
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> 
> 

One more occasion below:

	$(INSTALLER): $(SRC_PATH)/qemu.nsi
		make install prefix=${INSTDIR}

But this is already helpful:

Reviewed-by: Fam Zheng <famz@redhat.com>

