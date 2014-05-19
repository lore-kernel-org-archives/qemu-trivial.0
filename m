Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmRiU-0000p2-Pa
	for mharc-qemu-trivial@gnu.org; Mon, 19 May 2014 13:51:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WmRiN-0000jr-Tq
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 13:51:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WmRiF-0004cl-1O
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 13:51:07 -0400
Received: from mail-la0-f44.google.com ([209.85.215.44]:49672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WmRiE-0004cZ-QP
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 13:50:58 -0400
Received: by mail-la0-f44.google.com with SMTP id hr17so4431212lab.31
	for <qemu-trivial@nongnu.org>; Mon, 19 May 2014 10:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=q98vXIh/TuR+39u/ct2LOgx4tZ245whM4ovFF/AeJaA=;
	b=RSyDfqlCp2KeXqrRDJWEHb2OyGUWJjvsyEPXcbDKuLkjNbgEhbEz73Cn3arl6zqwmB
	qNftz4s/aNzlyoeHoi/xlAARpkv53d3VjemDNDprNPhn1GxySIghnaAypXxtWGGc7+5k
	VD8lJqcfkRm9s/G+KD5DaghVsT4/A+jf5/YNn6hroibfW46aPRFYOILQ8DezPTxdtAza
	gXdHt/Kp3i/HJDa6ofEshBPJBrwzSG4DdUxQ1TaJlT/CNJpmDESNG66F+f/P5zCAuYOd
	vT3uXlc9MgZ0c/VP2YME/dozwhtRFxUWUDuQlpd3gA5+lh28oT6UtiDOT/Q4alDDQfZf
	9HvA==
X-Gm-Message-State: ALoCoQkgEEzDytOTa6IHux8QN9qsDaIgDXPto6W3/UNjgIhktgS8vlljIxxecoHqGOpOSn84vpWE
X-Received: by 10.152.207.74 with SMTP id lu10mr27931474lac.28.1400521857698; 
	Mon, 19 May 2014 10:50:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Mon, 19 May 2014 10:50:37 -0700 (PDT)
In-Reply-To: <537A4368.4020203@redhat.com>
References: <1400519982-9264-1-git-send-email-peter.maydell@linaro.org>
	<537A4368.4020203@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 May 2014 18:50:37 +0100
Message-ID: <CAFEAcA8MwnfZisGusVqDVFGvRVZv7MR+7mWBVV8R58EX47RgKA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] configure: Put tempfiles in a subdir of
	the build directory
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
X-List-Received-Date: Mon, 19 May 2014 17:51:12 -0000

On 19 May 2014 18:46, Eric Blake <eblake@redhat.com> wrote:
> On 05/19/2014 11:19 AM, Peter Maydell wrote:
>> -# NB: do not call "exit" in the trap handler; this is buggy with some shells;
>> -# see <1285349658-3122-1-git-send-email-loic.minier@linaro.org>
>> -trap "rm -f $TMPC $TMPO $TMPCXX $TMPE" EXIT INT QUIT TERM
>
> While we don't need a trap that jumps through hoops, it may still be
> nice to have a 'rm -r ${TMPDIR1}' at the end of configure.  Just because
> we cleanup a leftover config-temp on start from an earlier aborted run
> doesn't mean that a clean run shouldn't clean up after itself.

Yeah, I was in two minds about that, but you're right that
it's a little neater to clean up after a successful run.

thanks
-- PMM

