Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XSQqR-0008RY-6p
	for mharc-qemu-trivial@gnu.org; Fri, 12 Sep 2014 09:24:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XSQqL-0008It-4v
	for qemu-trivial@nongnu.org; Fri, 12 Sep 2014 09:24:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XSQqE-0004SE-HJ
	for qemu-trivial@nongnu.org; Fri, 12 Sep 2014 09:24:53 -0400
Received: from mail-la0-f51.google.com ([209.85.215.51]:36218)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XSQqE-0004S1-Ap
	for qemu-trivial@nongnu.org; Fri, 12 Sep 2014 09:24:46 -0400
Received: by mail-la0-f51.google.com with SMTP id gi9so916458lab.38
	for <qemu-trivial@nongnu.org>; Fri, 12 Sep 2014 06:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=f08x2nh89izJDNGFhrLrb1tzFNn97ofPjSV3fR6Imvc=;
	b=j4Z1/5RUfjh5QUn32a3ahKxNTQH4udSdbjM8Df4ZTZ+v3vE3mgLCiGWoFKRSfDkc+M
	1wjdmneZdSWPQSufvMIdRLjoU9bZYD1MKroJRwEZWHG272vL75DmEZVO1sVzCISlOFo3
	WYYgD/g5E36VZ6yZl4VF7fYuYXITlvnn/ccqg7iQGW70xD5/Mp+wch7N3Rgqvp5GrAHR
	xOLaPzb9PVK2AwOtWnAXEpd+pYnaEmqzG/l6dGKqzd4Ff9187htcsvvaI7xM98wEefwL
	/MPh7fucX27VGLMR+aNvc1Moa/voWf8gZsfKhTU0HmGtdksofjqRQNVh4ZRAHn3KyRCY
	evrQ==
X-Gm-Message-State: ALoCoQkwPUCl+kOpQ6/3I94oMwwXsRHIkvs/sgpsz0eDcTNWpQLF8UDCXj7HfLO+qOgDt9XPWFsX
X-Received: by 10.152.7.38 with SMTP id g6mr9170644laa.26.1410528285321; Fri,
	12 Sep 2014 06:24:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Fri, 12 Sep 2014 06:24:25 -0700 (PDT)
In-Reply-To: <CAFEAcA9haYpJ4Rsd8W=Cjq44kL079=L7ByRP=HcecS9jW87v6w@mail.gmail.com>
References: <1410428416-5046-1-git-send-email-marc.mari.barcelo@gmail.com>
	<20140912082756.GB1614@stefanha-thinkpad.redhat.com>
	<CAFEAcA9haYpJ4Rsd8W=Cjq44kL079=L7ByRP=HcecS9jW87v6w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Sep 2014 14:24:25 +0100
Message-ID: <CAFEAcA8sQhhOna-anTEARYtzDHAcuQLW_Jwa4dTpHdfsonVcQA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.51
Cc: =?UTF-8?Q?Marc_Mar=C3=AD?= <marc.mari.barcelo@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [TRIVIAL][PATCH v2] libqos virtio: Increase ISR
	timeout
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
X-List-Received-Date: Fri, 12 Sep 2014 13:24:58 -0000

On 12 September 2014 09:30, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 September 2014 09:27, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>> On Thu, Sep 11, 2014 at 11:40:16AM +0200, Marc Mar=C3=AD wrote:
>>> Increase the clock step to avoid Travis failure in some builds due to
>>> overagressive timeout.
>>>
>>> Signed-off-by: Marc Mar=C3=AD <marc.mari.barcelo@gmail.com>
>>> ---
>>>  tests/libqos/virtio.c |    4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>
> Do you mind if I apply this directly to master to stop
> travis grumbling at us on irc?

Applied to master, thanks.

-- PMM

