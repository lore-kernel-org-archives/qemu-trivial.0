Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U2Nq6-0007Lw-5s
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2013 10:20:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1U2Npx-00070y-HR
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 10:20:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1U2Npw-0005OT-EL
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 10:20:01 -0500
Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233]:48178)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1U2Npu-0005Ny-7c; Mon, 04 Feb 2013 10:19:58 -0500
Received: by mail-la0-f51.google.com with SMTP id fo13so4603970lab.24
	for <multiple recipients>; Mon, 04 Feb 2013 07:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=Jc2+s6QNLWljnvOZyd1JnSQ7W5CycgfMEKmCegV506w=;
	b=UH3YaRLlk9QErxctaGYEpGzis4BgRKb4/iIpKhkDlAcmBw8RRC9XGGgcL84AyBHy2k
	HXpz0dALOqXy2jes8cv3dQnNrzDPYoXuAQDzSej5FJPCk7q70IfMaT4yvfVWzOE+mO70
	eR5vZV4iToi1DYayw0BI5JCbuOq3sAGzAuaT1/PMqfEISvg0B/BjdnDbZQ8C/Av8xvoH
	Uzlc3NdXqOwzk4zIU70ae5pjpQ6hEveUK+pP6GhUJEXPbCd7Ylt178hJaid/Vcg8oJw5
	mre5nAzBlv1gjl543OBwI7lr47Fw5pixqOK4LfeWJFFVsMLaNBXKCcm4i1YefaY6y1ZS
	jfdQ==
X-Received: by 10.152.134.243 with SMTP id pn19mr19555940lab.11.1359990864491; 
	Mon, 04 Feb 2013 07:14:24 -0800 (PST)
Received: from localhost (rocksteady.se.axis.com. [195.60.68.156])
	by mx.google.com with ESMTPS id t7sm5586542lbf.12.2013.02.04.07.14.23
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 07:14:23 -0800 (PST)
Date: Mon, 4 Feb 2013 16:14:21 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20130204151421.GA11479@edde.se.axis.com>
References: <1359267965-19902-1-git-send-email-afaerber@suse.de>
	<510FBADF.7000406@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <510FBADF.7000406@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::233
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-1.4] target-cris: Build
 fix for debug output
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
X-List-Received-Date: Mon, 04 Feb 2013 15:20:06 -0000

On Mon, Feb 04, 2013 at 02:42:55PM +0100, Andreas Färber wrote:
> Am 27.01.2013 07:26, schrieb Andreas Färber:
> > Around r3361 (81fdc5f8d2d681da8d255baf0713144f8656bac9) env->debug1 used
> > to contain the address of an MMU fault. This is now written into
> > env->pregs[PR_EDA] instead.
> > 
> > Signed-off-by: Andreas Färber <afaerber@suse.de>
> > ---
> >  target-cris/op_helper.c |    2 +-
> >  1 Datei geändert, 1 Zeile hinzugefügt(+), 1 Zeile entfernt(-)
> 
> Ping! Resent as part of my debug output RFC already, and it missed rc0.
> 
> CC'ing qemu-trivial as it should be easily confirmable by comparing the
> mentioned commit with today's MMU fault handler (helper.c iirc).


Applied, thanks.

Edgar

