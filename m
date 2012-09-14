Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TCQao-00055a-Ss
	for mharc-qemu-trivial@gnu.org; Fri, 14 Sep 2012 03:45:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TCQal-00053h-8a
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 03:45:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TCQaa-00057t-2W
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 03:45:35 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:56230)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TCQaZ-00057X-QW; Fri, 14 Sep 2012 03:45:24 -0400
Received: by weyz53 with SMTP id z53so2152496wey.4
	for <multiple recipients>; Fri, 14 Sep 2012 00:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RRUht83b/flaCCO24PSDLfQNBoYLF/Z6q4sQuDB11cE=;
	b=eM4bN3NLF0feQYaxZ3Eniiha90sWf2hSSIOk52A40eYc2P5aY0QNr/zVVh1P3MGw+o
	LhR1HNPWaEJdAlKyfLchDgN2T9onBHZBO0if9hZ+rGaBQy+m3U1b6b3xyVe34u7QQE0F
	oOAgTJNer/c8T+a/gl7WCIBGNE5OC1aISygGAhcpQRYFgwbuK7DnIDt5IEltY1PZO4YY
	OMW6NOdT1sBv2SDGyAc02uyIXqFDOkhggEVu0/QPm1SN8Qbsy1z8GLriLM6HI1g8Ks5Y
	BSbRIV0Ls/Bxb2/pTaGolqfAdHVzM99adoFKp3/Q3TuXNCjrY2QJeHRMcyN0cqBvx1lp
	6bXA==
Received: by 10.180.78.40 with SMTP id y8mr4082443wiw.7.1347608722700;
	Fri, 14 Sep 2012 00:45:22 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id b7sm2268375wiz.9.2012.09.14.00.45.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Sep 2012 00:45:22 -0700 (PDT)
Date: Fri, 14 Sep 2012 08:45:18 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20120914074518.GA25596@stefanha-thinkpad.localdomain>
References: <1346851582-9296-1-git-send-email-riegamaths@gmail.com>
	<504F1129.8060009@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <504F1129.8060009@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	riegamaths@gmail.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: Don't forget to
	delete temporary file
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
X-List-Received-Date: Fri, 14 Sep 2012 07:45:36 -0000

On Tue, Sep 11, 2012 at 12:23:37PM +0200, Kevin Wolf wrote:
> Am 05.09.2012 15:26, schrieb riegamaths@gmail.com:
> > From: Dunrong Huang <riegamaths@gmail.com>
> > 
> > The caller would not delete temporary file after failed get_tmp_filename().
> > 
> > Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
> 
> Thanks, applied to the block branch.

For the record, using the close(2) errno after calling unlink(2) isn't
a good idea.  We should follow the docs and preserve errno carefully.

It's the exact issue I pointed out on the original patch.

Stefan

