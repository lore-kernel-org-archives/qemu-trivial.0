Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U5ApQ-0001yZ-Ub
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2013 03:03:00 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U5ApO-0001yT-Jf
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2013 03:02:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U5ApM-0006jN-Io
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2013 03:02:58 -0500
Received: from mail-wi0-f182.google.com ([209.85.212.182]:35407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U5ApM-0006jD-CQ; Tue, 12 Feb 2013 03:02:56 -0500
Received: by mail-wi0-f182.google.com with SMTP id hi18so4026866wib.15
	for <multiple recipients>; Tue, 12 Feb 2013 00:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=GKKYbdcO2QQu3q00aXzNieGZGv325DV3MfFiYQ5ICA0=;
	b=TafrZSaE33cIWsHW/jQREmwa7WSyLLek3Z/NYI/YS3wTV4cyjGLn+S7rnHBXBzLYjN
	Tutk5/Sy3VtvX4bzI14uIRH2udppR2W5yp/KtK1QTyLbwzlmb82noNyuxxAfTHIZX9Ad
	ihsTrLHnh9H5ZD++nL/hH4D4x9dHphboDyLmBeh4hDePRjWlkDY0XnhnZfXn30KntsHF
	0ELp29TXUGjPyzf6pr9Nke7C5pPl4qqzpHjRhnNlNezHBuGjI9NTi35b+QzFncweNhzA
	G2B278Wa1rSkVLUqZBI3i5JQjWWuiwGtHr/wF7o3Jr2+bzcgexuph5XFrDFNea+Q9NKd
	dHvA==
X-Received: by 10.180.88.40 with SMTP id bd8mr1173783wib.17.1360655712846;
	Mon, 11 Feb 2013 23:55:12 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id ex15sm22832112wid.5.2013.02.11.23.55.10
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 23:55:11 -0800 (PST)
Date: Tue, 12 Feb 2013 08:55:09 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20130212075509.GA21403@stefanha-thinkpad.redhat.com>
References: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
	<20130211132727.GC6491@stefanha-thinkpad.redhat.com>
	<5118F322.709@redhat.com> <87k3qf9cg8.fsf@blackfin.pond.sub.org>
	<5118FDE9.2000101@suse.de>
	<CAFEAcA8FvkzDE2uV8bkStiFHzmhq+ERfa_ogXU7-HF8Wh90dhQ@mail.gmail.com>
	<CAJSP0QWpPAJ9kcfK9fwhDm0g1Zaf=5g7NH3jRcsaGUv3prAOCA@mail.gmail.com>
	<511909F6.7060002@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <511909F6.7060002@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.182
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	Blue Swirl <blauwirbel@gmail.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: log error when trying
 to use ATAPI overlapping features
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
X-List-Received-Date: Tue, 12 Feb 2013 08:03:00 -0000

On Mon, Feb 11, 2013 at 04:10:46PM +0100, Andreas Färber wrote:
> Am 11.02.2013 15:57, schrieb Stefan Hajnoczi:
> > On Mon, Feb 11, 2013 at 3:34 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> On 11 February 2013 14:19, Andreas Färber <afaerber@suse.de> wrote:
> >>> Am 11.02.2013 15:01, schrieb Markus Armbruster:
> >>>> Kevin Wolf <kwolf@redhat.com> writes:
> >>>>
> >>>>> Am 11.02.2013 14:27, schrieb Stefan Hajnoczi:
> >>>>>> I think we need to side-track this patch email to figure out what to
> >>>>>> use:
> >>>>>>
> >>>>>> fprintf(stderr) - some warnings/errors use this
> >>>>>> error_report() - goes to the monitor, if possible, otherwise stderr
> >>>>>
> >>>>> These look wrong to me.
> >>>>
> >>>> "Wrong" is a bit strong, in particular since there's ample precedence
> >>>> for these uses.
> >>
> >> Certainly for fprintf() I would say "deprecated" wherever
> >> we have a better API available.
> >>
> >>>>>> qemu_log_*() - goes to the qemu log, seems a little TCG-centric
> >>>>>
> >>>>> I would suggest either this or just trace points. (And by the way, it's
> >>>>> a pity that -d is so TCG-centric, it's been more than once the reason
> >>>>> why I disabled KVM when debugging a guest... Having at least -d int
> >>>>> would be so useful.)
> >>>>
> >>>> Tracepoints don't really fit when we want to report the guest does
> >>>> something we don't handle.  Users deserve fair warning then, don't they?
> >>>>
> >>>> Could qemu_log() & friends be made fit for general use?  What's missing?
> >>>
> >>> Blue already did some work to make it more usable, and I believe Peter
> >>> adopted LOG_UNIMPL for ARM devices in place of hw_error()
> >>
> >> Yes; in particular where we have classes of error message which the
> >> user may wish to enable or disable (of which "QEMU doesn't implement
> >> this" and "the guest just did something that's probably a guest bug"
> >> are two common ones) qemu_log_mask(LOG_*, ...) is the preferred
> >> API for devices IMHO. So I think Herve's patch is entirely the
> >> right thing.
> > 
> > qemu_log_mask() can replace fprintf() but it needs to default to
> > stderr and a reasonable default mask.  It should be used for
> > non-monitor command errors and warnings.
> > 
> > Having said that, I think we should use hw_error() or fprintf() in
> > this patch until qemu_log_mask() replaces them.
> 
> Nack. Like I just pointed out, hw_error() is a fatal abort and not a
> replacement for logging. I don't mind which of the non-fatal logging
> methods you choose, but guest-triggerable aborting is a semantic change
> that we should not choose just because someone doesn't like logging API
> or defaults. Especially not for 1.4.

You are right.

Stefan

