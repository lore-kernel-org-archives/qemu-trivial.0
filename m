Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnyWy-0001eB-7o
	for mharc-qemu-trivial@gnu.org; Sat, 15 Jun 2013 18:01:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1Uno5I-00029R-JV
	for qemu-trivial@nongnu.org; Sat, 15 Jun 2013 06:51:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1Uno5E-0007Az-SS
	for qemu-trivial@nongnu.org; Sat, 15 Jun 2013 06:51:52 -0400
Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d]:42661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>)
	id 1Uno58-00077f-G3; Sat, 15 Jun 2013 06:51:42 -0400
Received: by mail-wg0-f45.google.com with SMTP id j13so1173215wgh.0
	for <multiple recipients>; Sat, 15 Jun 2013 03:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=tEI/o9VzXnpmGya618UfmhZPBJT7DvTXZcAaKpRY/qQ=;
	b=QRK5sMbBVBsg6pKEMkNhAsA/EajlIZ+H0DbTUudAwtU7n014QVKZgv1Z3TsKaq/S+z
	Wom2yDDbLx0QZZ3Gk9cbgOsh+/s7dsHZ2BjyXhHzPYBZq3cSbsuX/8wiil9qz/tbdrh7
	80xbO51jCTI0pYqu/TjlZaCw718aJ5BfwVAtSqWlqIOGCGfLxPqeHr4rJ8VCaPPh2n2F
	atHFpibpWq5iw2P1NCnt5BCCgw1wCLSz6k6TcropGRxgVeEUIZhC0zyHmhwjAyaMBrkB
	1B5DFhaMVqDAMTYQMszEpayczUYLjT7h0BjT47TWtlSSeO8gbr9aUWsWJnD6yfVycy9H
	P+bA==
X-Received: by 10.180.78.98 with SMTP id a2mr810997wix.27.1371293500976;
	Sat, 15 Jun 2013 03:51:40 -0700 (PDT)
Received: from al.localnet (al.lekensteyn.nl. [2001:470:1f15:b83::c0d1:f1ed])
	by mx.google.com with ESMTPSA id
	ft10sm8614034wib.7.2013.06.15.03.51.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Jun 2013 03:51:39 -0700 (PDT)
From: Peter Wu <lekensteyn@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Sat, 15 Jun 2013 12:51:37 +0200
Message-ID: <12048990.5frBUX2jFf@al>
User-Agent: KMail/4.10.4 (Linux/3.9.1-1-custom; KDE/4.10.4; x86_64; ; )
In-Reply-To: <1371292923-28105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371292923-28105-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="nextPart11447545.2oy9yE6FXr"
Content-Transfer-Encoding: 7Bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22d
X-Mailman-Approved-At: Sat, 15 Jun 2013 18:01:05 -0400
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH trivial] vl: always define no_frame
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
X-List-Received-Date: Sat, 15 Jun 2013 10:52:00 -0000

This is a multi-part message in MIME format.

--nextPart11447545.2oy9yE6FXr
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 15 June 2013 14:42:03 Michael Tokarev wrote:
> Commit 047d4e151dd46 "Unbreak -no-quit for GTK, validate SDL options" broke
> build of qemu without sdl, by referencing `no_frame' variable which is
> defined inside #if SDL block.  Fix that by defining that variable
> unconditionally.
> 
> This is a better fix for the build issue introduced by that patch than
> a revert.  This change keeps the new functinality introduced by that patch
> and just fixes the compilation.  It still is not a complete fix around the
> original issue (not working -no-frame et al with -display gtk), because it
> makes only the legacy interface working, not the new suboption interface,
> so a few more changes are needed.

Reviewed-by: Peter Wu <lekensteyn@gmail.com>

-no-frame was deemed to be a SDL feature that was unnecessary for GTK, hence dropped. 
At run-time, it is checked whether -no-frame makes sense or not (that is, if `-display sdl` 
was specified or not). Original patch and discussion can be found at 
http://lists.nongnu.org/archive/html/qemu-devel/2013-06/msg01297.html.

As for the discussion about legacy options[1], are there plans to remove `-sdl` (replaced by 
`-display sdl`) and move the `-*-grab` and `-no-frame` to `-display sdl` options? If that is 
the idea, what about printing a message that the mentioned options are deprecated and 
removed in a future version?

Regards,
Peter

 [1]: http://lists.nongnu.org/archive/html/qemu-devel/2013-06/msg02437.html

> Cc: Peter Wu <lekensteyn@gmail.com>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  vl.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/vl.c b/vl.c
> index 9f8fd6e..f94ec9c 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -199,9 +199,7 @@ static int rtc_date_offset = -1; /* -1 means no change
> */ QEMUClock *rtc_clock;
>  int vga_interface_type = VGA_NONE;
>  static int full_screen = 0;
> -#ifdef CONFIG_SDL
>  static int no_frame = 0;
> -#endif
>  int no_quit = 0;
>  CharDriverState *serial_hds[MAX_SERIAL_PORTS];
>  CharDriverState *parallel_hds[MAX_PARALLEL_PORTS];

--nextPart11447545.2oy9yE6FXr
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="us-ascii"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;">
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On Saturday 15 June 2013 14:42:03 Michael Tokarev wrote:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Commit 047d4e151dd46 &quot;Unbreak -no-quit for GTK, validate SDL options&quot; broke</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; build of qemu without sdl, by referencing `no_frame' variable which is</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; defined inside #if SDL block.  Fix that by defining that variable</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; unconditionally.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; This is a better fix for the build issue introduced by that patch than</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; a revert.  This change keeps the new functinality introduced by that patch</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; and just fixes the compilation.  It still is not a complete fix around the</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; original issue (not working -no-frame et al with -display gtk), because it</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; makes only the legacy interface working, not the new suboption interface,</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; so a few more changes are needed.</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Reviewed-by: Peter Wu &lt;lekensteyn@gmail.com&gt;</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">-no-frame was deemed to be a SDL feature that was unnecessary for GTK, hence dropped. At run-time, it is checked whether -no-frame makes sense or not (that is, if `-display sdl` was specified or not). Original patch and discussion can be found at http://lists.nongnu.org/archive/html/qemu-devel/2013-06/msg01297.html.</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">As for the discussion about legacy options[1], are there plans to remove `-sdl` (replaced by `-display sdl`) and move the `-*-grab` and `-no-frame` to `-display sdl` options? If that is the idea, what about printing a message that the mentioned options are deprecated and removed in a future version?</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Regards,</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Peter</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> [1]: http://lists.nongnu.org/archive/html/qemu-devel/2013-06/msg02437.html</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Cc: Peter Wu &lt;lekensteyn@gmail.com&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Cc: qemu-trivial@nongnu.org</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Signed-off-by: Michael Tokarev &lt;mjt@tls.msk.ru&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; ---</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  vl.c |    2 --</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  1 file changed, 2 deletions(-)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; diff --git a/vl.c b/vl.c</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; index 9f8fd6e..f94ec9c 100644</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; --- a/vl.c</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; +++ b/vl.c</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; @@ -199,9 +199,7 @@ static int rtc_date_offset = -1; /* -1 means no change</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; */ QEMUClock *rtc_clock;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  int vga_interface_type = VGA_NONE;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  static int full_screen = 0;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; -#ifdef CONFIG_SDL</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  static int no_frame = 0;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; -#endif</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  int no_quit = 0;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  CharDriverState *serial_hds[MAX_SERIAL_PORTS];</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  CharDriverState *parallel_hds[MAX_PARALLEL_PORTS];</p></body></html>
--nextPart11447545.2oy9yE6FXr--


