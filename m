Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZXyUj-0001Z3-Fp
	for mharc-qemu-trivial@gnu.org; Fri, 04 Sep 2015 17:26:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZXyUg-0001N0-S0
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 17:25:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZXyUM-0002Tt-V8
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 17:25:48 -0400
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f]:36524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZXyUA-0002KP-IZ; Fri, 04 Sep 2015 17:25:26 -0400
Received: by wibz8 with SMTP id z8so29488046wib.1;
	Fri, 04 Sep 2015 14:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=u2LH58kY0t+lFDFkxKnf0+jhRH8SE6c9YVOOVK6Yw6E=;
	b=BeemsRvCtSkdF3iw+Gq4utaPL4c3urrAkbsk3DHmBPV+XLVfKttpaAsQyVqv59x+4n
	DITD3vbyiiGsv28CHGRE2LVS+34C/TssPiddsIHTU/QhBmdWfT1hoUKO5zfsWp1JxmM1
	GyRXnLuMG+f25+M/HzvkHrU92AiP9xPvj0b9r/ycXTMbAow2Z3GRUWsGbk0EhYTKHySB
	fximHkHSduW26WYIK/X8aTiRrXYqgg9Qgpr2GGGhsaxRpaz5xGCOpK1w2BuyoyNAAZpX
	OScPJh+ry2B2NbMIApZ6NA6SJc+dZN/BaPZ0fXczs8+dZ8ZFDGw55h4PnRdI+OI/MOdR
	Swvw==
MIME-Version: 1.0
X-Received: by 10.194.202.137 with SMTP id ki9mr10472926wjc.16.1441401917826; 
	Fri, 04 Sep 2015 14:25:17 -0700 (PDT)
Received: by 10.28.134.18 with HTTP; Fri, 4 Sep 2015 14:25:17 -0700 (PDT)
In-Reply-To: <1441400485-29167-1-git-send-email-marcandre.lureau@redhat.com>
References: <1441400485-29167-1-git-send-email-marcandre.lureau@redhat.com>
Date: Fri, 4 Sep 2015 14:25:17 -0700
Message-ID: <CAPokK=rjOTto8oNJVQKLx4ib87nQbvawtez1PhgUDcprGk3d0g@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22f
Cc: qemu-trivial@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qom/object.h: remove some
	child/parent doc
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
X-List-Received-Date: Fri, 04 Sep 2015 21:25:59 -0000

On Fri, Sep 4, 2015 at 2:01 PM,  <marcandre.lureau@redhat.com> wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> It looks like this documentation is obsolete: a child object may lookup
> its parent stored in the Object struct.
>

Using a function wrapper or direct access to Object structure field?

The latter would indicate they are workarounds. Which legit uses of
parent identification are you referring to?

Regards,
Peter

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qom/object.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 2f95ab3..653699f 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1261,9 +1261,6 @@ Object *object_resolve_path_component(Object *paren=
t, const gchar *part);
>   * Child properties form the composition tree.  All objects need to be a=
 child
>   * of another object.  Objects can only be a child of one object.
>   *
> - * There is no way for a child to determine what its parent is.  It is n=
ot
> - * a bidirectional relationship.  This is by design.
> - *
>   * The value of a child property as a C string will be the child object'=
s
>   * canonical path. It can be retrieved using object_property_get_str().
>   * The child object itself can be retrieved using object_property_get_li=
nk().
> --
> 2.4.3
>
>

