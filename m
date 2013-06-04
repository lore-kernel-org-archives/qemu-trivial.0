Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjyCA-0001yi-RD
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 16:51:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyC8-0001y8-CP
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:51:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyC7-00069F-Eq
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:51:04 -0400
Received: from mail-lb0-f170.google.com ([209.85.217.170]:35029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyC7-00068v-7I
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:51:03 -0400
Received: by mail-lb0-f170.google.com with SMTP id t11so1167772lbd.29
	for <qemu-trivial@nongnu.org>; Tue, 04 Jun 2013 13:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=NrKgiCzMQ5Uu8fKuSKHYray+AmbrU1wzIHp84xza/vE=;
	b=NYvDVIJYAkHdgL1InucpQByhdZEPnH+Wo70MwGODpCiA4zDyfRbKr2HYBHjYAJjox+
	d9MiqZ1AT97GVH0sBH1OaQ4jD+9tsN4Uo2bhtvJYTncMGU0OB+pj39ac9+QcYZ7gsdch
	ryfryIkhhop9vfNFTCYn5A2kK5E0jQEWustoh9s+7ach+Airp1OvgFYAm62bfmv7iWvP
	b42l4SbpW6HRXaCbzXYuOHJAohqdyca6ViK3sSQfpPp8gNqXDtCqPf16z0vraqay2/Ey
	fmL9jDhkqKQ7YLWdr/SnVq8y098+o+1gas+zmxUfT2Xy2EbSskNOq+hDhn1GhFzAGFNI
	dwyQ==
X-Received: by 10.112.120.170 with SMTP id ld10mr563956lbb.31.1370379061913;
	Tue, 04 Jun 2013 13:51:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.2.39 with HTTP; Tue, 4 Jun 2013 13:50:41 -0700 (PDT)
In-Reply-To: <1370377419-31788-2-git-send-email-alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
	<1370377419-31788-2-git-send-email-alevy@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jun 2013 21:50:41 +0100
Message-ID: <CAFEAcA9oj-yCdsQck4oJPc__MyfrroMB2aFKSxTx1=PYfS2WCw@mail.gmail.com>
To: Alon Levy <alevy@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmsQfW1cMSHe3m6qc95CVjhcjNwT90cYO2G52xthZuUMftUClOUospm9C9EVE3npUhAGHYw
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.170
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/5] use qemu_pipe_non_block
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
X-List-Received-Date: Tue, 04 Jun 2013 20:51:06 -0000

On 4 June 2013 21:23, Alon Levy <alevy@redhat.com> wrote:
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -1797,15 +1797,11 @@ static void qxl_send_events(PCIQXLDevice *d, uint32_t events)
>
>  static void init_pipe_signaling(PCIQXLDevice *d)
>  {
> -    if (pipe(d->pipe) < 0) {
> -        fprintf(stderr, "%s:%s: qxl pipe creation failed\n",
> -                __FILE__, __func__);
> +    if (qxl_pipe_non_block(d->pipe)) {

Surely this can't compile? -- this function doesn't exist.

thanks
-- PMM

