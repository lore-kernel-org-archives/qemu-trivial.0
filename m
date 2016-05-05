Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ayM5J-00041X-Eb
	for mharc-qemu-trivial@gnu.org; Thu, 05 May 2016 12:25:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayM5A-0003jR-3m
	for qemu-trivial@nongnu.org; Thu, 05 May 2016 12:25:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayM4v-0001zR-7v
	for qemu-trivial@nongnu.org; Thu, 05 May 2016 12:24:50 -0400
Received: from mail-yw0-x231.google.com ([2607:f8b0:4002:c05::231]:33497)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayM4u-0001n7-1k
	for qemu-trivial@nongnu.org; Thu, 05 May 2016 12:24:41 -0400
Received: by mail-yw0-x231.google.com with SMTP id t10so145803835ywa.0
	for <qemu-trivial@nongnu.org>; Thu, 05 May 2016 09:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8aHq7uUsTGowqxrXs1J5U5qxQTUQGMF4wWzTM6m/uig=;
	b=K0qcK6f8ogfXpuBxY3/sr0KDIWuyKyoBAAwPO0yI4jkMi1i6GL1SKnyVrtB/v3zCQc
	gzwo5n0uKa0xwN963Tf21ZNR+PkVTTgBYE0Yu3m/eggvPOxFUv7JU835UnmGLPp5ETZJ
	sI8zbEK+3Miincic465WR1HMAeXMV4eAUhhks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8aHq7uUsTGowqxrXs1J5U5qxQTUQGMF4wWzTM6m/uig=;
	b=fyUpQJ+j7brbDwj9qqDLpi6Gx7SdI1Wk3xaPH/mXVN0fKK1HIAWQDK3lrXit1cTX6b
	eollPP2H8TMU9FknU93zEeOqVuX2s4iAFBcu86WobQw4GUG/za628Lpkqa8LS01zPslB
	PXUkzjsibuWM8VJ1JpsBmh66LTQAluzdJrz8nPemqFhGtEtQT2GJ6SalVwX4mvv9yQWP
	K6ewMZ648bpktZdqmQ3vLS6weGVVC32EANe8uzv0ma+prXSbHGxRW8yIo3BLBl9uvQa2
	YmTdk/5sPjCcnrD7xDxkLRDWC+Mp7bqoZvfkVKbbuBbmKJM4A1/0NpltOS+D6J+3k7kq
	DFTQ==
X-Gm-Message-State: AOPr4FXwv5VKMAC531oVOdklN0g8Vk7loOR0kJUlk8JQBJgtAIf6mph7IEpAr57e+NgFifixJhzjrou45AEmDQVS
X-Received: by 10.159.54.232 with SMTP id p95mr9621580uap.107.1462465458038;
	Thu, 05 May 2016 09:24:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 5 May 2016 09:23:58 -0700 (PDT)
In-Reply-To: <1462316319-4308-1-git-send-email-peter@lekensteyn.nl>
References: <1462316319-4308-1-git-send-email-peter@lekensteyn.nl>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2016 17:23:58 +0100
Message-ID: <CAFEAcA9Mr2h_xPZdd4a7wW-jUvT5bVXQKp5rsZWRa_ikLY9sWQ@mail.gmail.com>
To: Peter Wu <peter@lekensteyn.nl>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gdbstub: avoid busy loop
 while waiting for gdb
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
X-List-Received-Date: Thu, 05 May 2016 16:25:02 -0000

On 3 May 2016 at 23:58, Peter Wu <peter@lekensteyn.nl> wrote:
> While waiting for a gdb response, or while sending an acknowledgement
> there is not much to do, so just mark the socket as non-blocking to
> avoid a busy loop while paused at gdb. This only affects the user-mode
> emulation (qemu-arm -g 1234 ./a.out).
>
> Note that this issue was reported before at
> https://lists.nongnu.org/archive/html/qemu-devel/2013-02/msg02277.html.
>
> While at it, close the gdb client fd on EOF or error while reading.
>
> Signed-off-by: Peter Wu <peter@lekensteyn.nl>
> ---
>  gdbstub.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 0e431fd..b126bf5 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -332,7 +332,7 @@ static int get_char(GDBState *s)
>          if (ret < 0) {
>              if (errno == ECONNRESET)
>                  s->fd = -1;
> -            if (errno != EINTR && errno != EAGAIN)
> +            if (errno != EINTR)
>                  return -1;
>          } else if (ret == 0) {
>              close(s->fd);
> @@ -393,7 +393,7 @@ static void put_buffer(GDBState *s, const uint8_t *buf, int len)
>      while (len > 0) {
>          ret = send(s->fd, buf, len, 0);
>          if (ret < 0) {
> -            if (errno != EINTR && errno != EAGAIN)
> +            if (errno != EINTR)
>                  return;
>          } else {
>              buf += ret;
> @@ -1542,9 +1542,13 @@ gdb_handlesig(CPUState *cpu, int sig)
>              for (i = 0; i < n; i++) {
>                  gdb_read_byte(s, buf[i]);
>              }
> -        } else if (n == 0 || errno != EAGAIN) {
> +        } else {
>              /* XXX: Connection closed.  Should probably wait for another
>                 connection before continuing.  */
> +            if (n == 0) {
> +                close(s->fd);
> +            }
> +            s->fd = -1;
>              return sig;
>          }
>      }
> @@ -1599,8 +1603,6 @@ static void gdb_accept(void)
>      gdb_has_xml = false;
>
>      gdbserver_state = s;
> -
> -    fcntl(fd, F_SETFL, O_NONBLOCK);
>  }
>
>  static int gdbserver_open(int port)

It does look like all the places we use s->fd:
 * are only for user-mode
 * are currently coded as "loop round until we get something",
   so effectively blocking but doing it with a busy loop

I suspect the O_NONBLOCK here may be legacy from before the
system-emulation gdbstub was reworked to use a chr backend
(in system emulation there really are other things we need
to attend to besides gdb stub packets, like the monitor).

Other than the error in the commit message,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

