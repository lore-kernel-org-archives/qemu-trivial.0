Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlXom-0000RK-Qb
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 22:56:24 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geleman@gmail.com>) id 1QlXok-0000HR-7o
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 22:56:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geleman@gmail.com>) id 1QlXoj-0004Tw-7h
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 22:56:22 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:60264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geleman@gmail.com>)
	id 1QlXog-0004TZ-R1; Mon, 25 Jul 2011 22:56:18 -0400
Received: by ywb3 with SMTP id 3so7182ywb.4
	for <multiple recipients>; Mon, 25 Jul 2011 19:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=V/6PnNuWLiBYe6IBH6RLm6+WMkP3IGL6nZr52MvBGdU=;
	b=GRbGIpf5FKOcS+LwPv3vQPc1RVeTfExz4ScRp5WfN0/1L2Dy7pjy26NUg8hvvUNmT4
	/GHfBf6kQ4US0af1Kjb1aHd88iwk9J1+QvfifGRuLMrg6Clqc7/qp4L2qOdMJCpqsjSD
	FwOzHz1F/VH/mvCdeDeqJPlEGkssDHS8AbSTk=
MIME-Version: 1.0
Received: by 10.147.136.19 with SMTP id o19mr4687793yan.38.1311648977933; Mon,
	25 Jul 2011 19:56:17 -0700 (PDT)
Received: by 10.146.82.8 with HTTP; Mon, 25 Jul 2011 19:56:17 -0700 (PDT)
In-Reply-To: <4E2E274B.9020608@us.ibm.com>
References: <1311647049-1896-1-git-send-email-geleman@gmail.com>
	<4E2E274B.9020608@us.ibm.com>
Date: Tue, 26 Jul 2011 10:56:17 +0800
Message-ID: <CAETRQW=MWb+nyeOFgENxj-KZS_k477fa07gdfTZz9EWr-JkN2A@mail.gmail.com>
From: TeLeMan <geleman@gmail.com>
To: Anthony Liguori <aliguori@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] console: Don't expose the the ui
 module's functions when the module is not available.
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
X-List-Received-Date: Tue, 26 Jul 2011 02:56:23 -0000

On Tue, Jul 26, 2011 at 10:32, Anthony Liguori <aliguori@us.ibm.com> wrote:
> On 07/25/2011 09:24 PM, TeLeMan wrote:
>>
>> If there is no sdl support, the implement of sdl_display_init() is missi=
ng
>> and its declaration should not be exposed.
>> vnc, cocoa, curses and other ui modules are the same as sdl.
>>
>> Signed-off-by: TeLeMan<geleman@gmail.com>
>
> Nack.
>
> There's no harm in exposing these and it avoids cluttered #ifdefs.
This patch can avoid breakage on link stage . See my another patch:
http://lists.nongnu.org/archive/html/qemu-devel/2011-07/msg02616.html


> Regards,
>
> Anthony Liguori
>
>> ---
>> =C2=A0console.h | =C2=A0 =C2=A09 ++++++++-
>> =C2=A01 files changed, 8 insertions(+), 1 deletions(-)
>>
>> diff --git a/console.h b/console.h
>> index 67d1373..ede8bea 100644
>> --- a/console.h
>> +++ b/console.h
>> @@ -363,19 +363,24 @@ void qemu_console_copy(DisplayState *ds, int src_x=
,
>> int src_y,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 int dst_x, int dst_y, int w, int h);
>>
>> =C2=A0/* sdl.c */
>> +#ifdef CONFIG_SDL
>> =C2=A0void sdl_display_init(DisplayState *ds, int full_screen, int no_fr=
ame);
>> +#endif
>>
>> =C2=A0/* cocoa.m */
>> +#ifdef CONFIG_COCOA
>> =C2=A0void cocoa_display_init(DisplayState *ds, int full_screen);
>> +#endif
>>
>> =C2=A0/* vnc.c */
>> +#ifdef CONFIG_VNC
>> =C2=A0void vnc_display_init(DisplayState *ds);
>> =C2=A0void vnc_display_close(DisplayState *ds);
>> =C2=A0int vnc_display_open(DisplayState *ds, const char *display);
>> =C2=A0void vnc_display_add_client(DisplayState *ds, int csock, int skipa=
uth);
>> =C2=A0int vnc_display_disable_login(DisplayState *ds);
>> =C2=A0char *vnc_display_local_addr(DisplayState *ds);
>> -#ifdef CONFIG_VNC
>> +
>> =C2=A0int vnc_display_password(DisplayState *ds, const char *password);
>> =C2=A0int vnc_display_pw_expire(DisplayState *ds, time_t expires);
>> =C2=A0void do_info_vnc_print(Monitor *mon, const QObject *data);
>> @@ -401,6 +406,8 @@ static inline void do_info_vnc_print(Monitor *mon,
>> const QObject *data)
>> =C2=A0#endif
>>
>> =C2=A0/* curses.c */
>> +#ifdef CONFIG_CURSES
>> =C2=A0void curses_display_init(DisplayState *ds, int full_screen);
>> +#endif
>>
>> =C2=A0#endif
>
>

