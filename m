Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtDNw-0003pD-QM
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2015 06:34:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZtDNu-0003oj-9C
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 06:34:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZtDNt-0004kr-8V
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 06:34:46 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:33018)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZtDNt-0004ke-25
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 06:34:45 -0500
Received: by vkgy127 with SMTP id y127so83824165vkg.0
	for <qemu-trivial@nongnu.org>; Mon, 02 Nov 2015 03:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=crorXEpGh3KwK3+GwgxRyAxQCNnWfSQkz4jgjjZ59JU=;
	b=XfstLvD7detsQNAPx8QKuYgN0sJ3eJrvwhb/3VFEXeR3ufD7khsIJ5Tqb+5XVo/CB9
	57Yh4ky5gBeecz+ItAgXLjoMMclOayu2jrQHakVm/iaZT/TcC/VO2+Vx1v+7HHH9ZQMb
	z9qxSwqjfvk9MQITDHgB3N0BgwnPK3xgDF92jsv3tughojzkuxGd1HX4LIf8aXzJmgzS
	K1G36dvWQlL+AUFDk5D+IykBQgGymVb+18jvrxIpWhwq5b9WlXMuiARMFtcL0XH0TAj8
	FMFvYXcK6cWrlD/ZENK3HvQY11MaIg07h3A3DW5rTRb9YfsuImGmkUkGf+aT5ZshVO/V
	h0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=crorXEpGh3KwK3+GwgxRyAxQCNnWfSQkz4jgjjZ59JU=;
	b=R5+NemWdFc8awObYY+Qn2ZB7JbRRfliFBjx6ZmHkxW3xvHUAjMsUntxm12/otlh9Gs
	HZMAOU1i0201OqibHo5YjFW5P5qtwEwVFP29t5Dj1lQqx75CxhrdWYnnKFBJUoNVusG2
	he+/ZbARA4rJrOCg2zE3t9dzfo3BSgKmvr1J2dWJHhK9UQJK4JLhEGCDxbxCeJV5mqaD
	XxtsHR5IuOinHUkdSFaiz3Bb7G+rImXuGYAevQdaSixHWZyBccFZwMcDPCCPxeBTvUu2
	0gvDHqNoKUZO3SVeITrEP+iOkxskxeleNACN9xyoKtjd4PEw0OA6/BU2T7Be136M4e6R
	vB9A==
X-Gm-Message-State: ALoCoQnZxjSBpyyWFltZK/1IY+go95TkYNdcN/+K1isgDzlCfnqTaPnxi+Mvp+Ojc9rt57k+PoYn
X-Received: by 10.31.8.69 with SMTP id 66mr14147650vki.82.1446464084679; Mon,
	02 Nov 2015 03:34:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 2 Nov 2015 03:34:25 -0800 (PST)
In-Reply-To: <1446455064-1792-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1446455064-1792-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2015 11:34:25 +0000
Message-ID: <CAFEAcA_FnN9a3Kc_izXOSGYH_7JXy3qfww0h40tGuPZ8krN0eQ@mail.gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qom/object: fix 2 comment
	typos
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
X-List-Received-Date: Mon, 02 Nov 2015 11:34:47 -0000

On 2 November 2015 at 09:04, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  include/qom/object.h | 2 +-
>  qom/object.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/qom/object.h b/include/qom/object.h
> index be7280c..9e5162a 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -511,7 +511,7 @@ struct TypeInfo
>  /**
>   * OBJECT_CLASS_CHECK:
>   * @class: The C type to use for the return value.
> - * @obj: A derivative of @type to cast.
> + * @obj: A derivative class of @class to cast.
>   * @name: the QOM typename of @class.

I think this is right but not sufficient. Since OBJECT_CLASS_CHECK's
second parameter is not an object but a class, the name "obj" is
rather misleading and should be changed. My suggestion would be
to use

 * @classtype: The C type to use for the return value.
 * @class: A derivative class of @classtype to cast.
 * @name: the QOM typename of @class.

(and the macro definition parameter names should change to match).

>   *
>   * A type safe version of @object_class_dynamic_cast_assert.  This macro is
> diff --git a/qom/object.c b/qom/object.c
> index 11cd86b..fc6e161 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -204,7 +204,7 @@ static bool type_is_ancestor(TypeImpl *type, TypeImpl *target_type)
>  {
>      assert(target_type);
>
> -    /* Check if typename is a direct ancestor of type */
> +    /* Check if target_type is a direct ancestor of type */
>      while (type) {
>          if (type == target_type) {
>              return true;

This change is good.

thanks
-- PMM

