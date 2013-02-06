Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U36KF-0000Q0-TL
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2013 09:50:15 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U36KA-0000OS-DU
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2013 09:50:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U36K1-0003jr-3R
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2013 09:50:10 -0500
Received: from mail-wi0-f177.google.com ([209.85.212.177]:44656)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U36K0-0003jT-Ss; Wed, 06 Feb 2013 09:50:01 -0500
Received: by mail-wi0-f177.google.com with SMTP id hm14so1645229wib.16
	for <multiple recipients>; Wed, 06 Feb 2013 06:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=FaFHcySwMiaCDoereL43HwHrDxKefKabnuCdbLdQGaM=;
	b=Sdoi8u6H4r6NP7xiT4cyjSfUZa1CyLOIQJ4tICMVEcVnEUx/A9g1DCJHdv08fmNX91
	H2JTQLYzyrkTrP+y+fNs5Lcj0y4AJB2rgQuCL1571m/lqjQjchtebAA/HLimtSl/x2Sg
	w9elGYHx8h8aSvlizVacVpVhqcP5OHdBCQUzzR1tXRHY+ZPXaZNcTo1zVRjsSi4adPIR
	ZLDXKm5MppJIcn9zLagO2ZiBuxB6ODQdTrH7XglL0yFGclgNlVsSBaRvoeaw3rni0Ap9
	Ppgd2EPBfPe4GG/ogkUW4dYAEu4k/5NQulXvjm1ri6Bps9uperBFb6npMT29Bt1cYwxa
	9Yzw==
X-Received: by 10.194.238.5 with SMTP id vg5mr50211760wjc.40.1360162199703;
	Wed, 06 Feb 2013 06:49:59 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id ex1sm3709095wib.7.2013.02.06.06.49.57
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 06:49:58 -0800 (PST)
Date: Wed, 6 Feb 2013 15:49:56 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <20130206144956.GA22233@stefanha-thinkpad.redhat.com>
References: <9021f2f9e51e4c7a253d1993ea05f87d0718752f.1359627279.git.mprivozn@redhat.com>
	<510B90C9.8000309@suse.de> <510BDCBF.5040108@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <510BDCBF.5040108@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.177
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Undefine
 _FORTIFY_SOURCE prior using it
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
X-List-Received-Date: Wed, 06 Feb 2013 14:50:14 -0000

On Fri, Feb 01, 2013 at 04:18:23PM +0100, Michal Privoznik wrote:
> On 01.02.2013 10:54, Andreas Färber wrote:
> > Am 31.01.2013 11:15, schrieb Michal Privoznik:
> >> Currently, we are enforcing the _FORTIFY_SOURCE=2 without any
> >> previous detection if the macro has been already defined, e.g.
> >> by environment, or is just enabled by compiler by default.
> >>
> >> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> >> ---
> >>  configure | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/configure b/configure
> >> index b7635e4..97070eb 100755
> >> --- a/configure
> >> +++ b/configure
> >> @@ -3159,7 +3159,7 @@ if test "$gcov" = "yes" ; then
> >>    CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
> >>    LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
> >>  elif test "$debug" = "no" ; then
> >> -  CFLAGS="-O2 -D_FORTIFY_SOURCE=2 $CFLAGS"
> >> +  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
> >>  fi
> >>  
> >>  
> > 
> > Should we maybe instead add a compile-test?
> > 
> > #ifdef _FORTIFY_SOURCE
> > #if _FORTIFY_SOURCE >= 2
> > #error Environment already has _FORTIFY_SOURCE
> > #endif
> > #endif
> > 
> > I admit I have no clue what the number means and whether there are more
> > fortified levels.
> > 
> > Cheers,
> > Andreas
> > 
> 
> I don't think that's necessary. The 2nd level is the highest one [1] or [2].
> It seems like in my case it's compiler who's defining the macro:
> 
> $ echo "int main() {return 0;}" | gcc -D_FORTIFY_SOURCE=2 -x c -
> <command-line>:0:0: warning: "_FORTIFY_SOURCE" redefined [enabled by default]
> <stdin>:1:0: note: this is the location of the previous definition
> 
> in which case we must undefine it. However, if the _FORTIFY_SOURCE is
> defined by environment, I think we should not override it. So maybe need
> a different approach. Anyway, with current state I cannot compile. I am using
> gcc version 4.7.2 (Gentoo 4.7.2 p1.3, pie-0.5.5)

It would be nice to fix this for QEMU 1.4 but my gcc FORTIFY_SOURCE foo
is not strong enough to know what the best approach is here.

Reviews from anyone else?

Stefan

