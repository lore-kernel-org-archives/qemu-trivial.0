Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT56E-0004A8-5e
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 08:42:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <baiyaowei@cmss.chinamobile.com>) id 1fT1Ox-000882-6C
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 04:45:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <baiyaowei@cmss.chinamobile.com>) id 1fT1Os-0002KN-Hy
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 04:45:11 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:26201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <baiyaowei@cmss.chinamobile.com>)
	id 1fT1Or-0002Fq-Rt; Wed, 13 Jun 2018 04:45:06 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.15]) by
	rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id
	2eec5b20d98df46-4c1dc; Wed, 13 Jun 2018 16:45:01 +0800 (CST)
X-RM-TRANSID: 2eec5b20d98df46-4c1dc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost (unknown[223.105.0.243])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id
	2ee85b20d98d09a-fe56d; Wed, 13 Jun 2018 16:45:01 +0800 (CST)
X-RM-TRANSID: 2ee85b20d98d09a-fe56d
Date: Wed, 13 Jun 2018 04:44:56 -0400
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: "Emilio G. Cota" <cota@braap.org>
Cc: mjt@tls.msk.ru, laurent@vivier.eu, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, stefanha@redhat.com
Message-ID: <20180613084455.GA13936@byw>
Reply-To: baiyaowei@cmss.chinamobile.com
References: <1528859749-25286-1-git-send-email-baiyaowei@cmss.chinamobile.com>
	<20180613035030.GB25430@flamenco>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180613035030.GB25430@flamenco>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.81
X-Mailman-Approved-At: Wed, 13 Jun 2018 08:42:03 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tracing.txt: add missing
 '-' for trace option
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
X-List-Received-Date: Wed, 13 Jun 2018 08:45:12 -0000

On Tue, Jun 12, 2018 at 11:50:30PM -0400, Emilio G. Cota wrote:
> On Tue, Jun 12, 2018 at 23:15:49 -0400, Yaowei Bai wrote:
> > Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
> > ---
> >  docs/devel/tracing.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/docs/devel/tracing.txt b/docs/devel/tracing.txt
> > index 07abbb3..6ab32cc 100644
> > --- a/docs/devel/tracing.txt
> > +++ b/docs/devel/tracing.txt
> > @@ -18,7 +18,7 @@ for debugging, profiling, and observing execution.
> >  
> >  3. Run the virtual machine to produce a trace file:
> >  
> > -    qemu -trace events=/tmp/events ... # your normal QEMU invocation
> > +    qemu --trace events=/tmp/events ... # your normal QEMU invocation
> 
> The second dash is not missing; both '-args' and '--args' work.
> 
> '-args' seems to be favoured though; see `qemu -h' or `qemu --h' :-)

Oh, you're right. I just checked qemu-nbd/io utilities. Forget about
this change. Thanks. :-)

> 
> 		Emilio



