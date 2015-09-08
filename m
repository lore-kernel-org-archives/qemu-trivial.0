Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZFJK-0003N7-MQ
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 05:35:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZZFJH-0003KB-KJ
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 05:35:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZZFJD-0003rU-BI
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 05:35:27 -0400
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e]:35475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1ZZFJ7-0003nY-9P; Tue, 08 Sep 2015 05:35:17 -0400
Received: by wicge5 with SMTP id ge5so108988751wic.0;
	Tue, 08 Sep 2015 02:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=yZXd466WTTroFnMrAJvPvApcPRME4xrG7kCFvRO1Iio=;
	b=J4pv8NtmUAa6V5MaNaFqaLywzwqYbd99Z2WncXRNkrzH6+jmCqJJ7G+U9bKfIMRhP9
	6GjOFyaqAmGLPhRQ/Wlkq7Xx36JzyoG5lL8SnhO5wGWlP/CxVrz7Ha6/Dhak5AXzDc7e
	IxVoe2YI5E+fvcfxTZ4zDfm7G0zCH1scvw6QrR998sxz6vEQYY5TFCxjErjtyUmg5BE1
	Bj1x/zESZCf6IeBCa53/jQ+Bpxg3dBhV7jTjLubzdLrBGxAjnKA9hnuBLPU4m437I5T+
	0oKz5jWistM8Jdab83TVUlyA5lbfy/jhcMBYPk4DqeYGtsjKGpgJsi3+XU8myeWk3s8t
	6AdA==
X-Received: by 10.194.91.193 with SMTP id cg1mr36036478wjb.88.1441704916815;
	Tue, 08 Sep 2015 02:35:16 -0700 (PDT)
Received: from [192.168.10.165] ([94.39.138.45])
	by smtp.googlemail.com with ESMTPSA id
	mx19sm3846342wic.0.2015.09.08.02.35.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 02:35:16 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <1441704488-9512-1-git-send-email-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55EEABD3.2090903@redhat.com>
Date: Tue, 8 Sep 2015 11:35:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1441704488-9512-1-git-send-email-berrange@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22e
Subject: Re: [Qemu-trivial] [PATCH repost] gtk: avoid redefining
	_WIN32_WINNT macro
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
X-List-Received-Date: Tue, 08 Sep 2015 09:35:28 -0000



On 08/09/2015 11:28, Daniel P. Berrange wrote:
> In file included from ui/gtk.c:40:0:
> include/ui/gtk.h:5:0: warning: "_WIN32_WINNT" redefined
>  # define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_TO_VSC */
>   ^
> In file included from /usr/i686-w64-mingw32/sys-root/mingw/include/crtdefs.h:10:0,
>                  from /usr/i686-w64-mingw32/sys-root/mingw/include/stdio.h:9,
>                  from /home/berrange/src/virt/qemu/include/qemu/fprintf-fn.h:12,
>                  from /home/berrange/src/virt/qemu/include/qemu-common.h:18,
>                  from ui/gtk.c:37:
> /usr/i686-w64-mingw32/sys-root/mingw/include/_mingw.h:225:0: note: this is the location of the previous definition
>  #define _WIN32_WINNT 0x502
>  ^
> 
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  include/ui/gtk.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/ui/gtk.h b/include/ui/gtk.h
> index ee6dffd..7796231 100644
> --- a/include/ui/gtk.h
> +++ b/include/ui/gtk.h
> @@ -2,7 +2,9 @@
>  #define UI_GTK_H
>  
>  #ifdef _WIN32
> -# define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_TO_VSC */
> +# ifndef _WIN32_WINNT
> +#  define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_TO_VSC */
> +# endif
>  #endif

Your error message shows that _WIN32_WINNT was 0x0502, do you get
MAPVK_VK_TO_VSC with this patch?

Perhaps #undef the macro first, or do something like:

#if !defined _WIN32_WINNT || _WIN32_WINNT < 0x0601
# undef _WIN32_WINNT
# define _WIN32_WINNT 0x0601
#endif

Paolo

