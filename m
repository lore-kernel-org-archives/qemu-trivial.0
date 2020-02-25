Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Wg4-0006Ms-1Z
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2020 04:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54879)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Wg0-0006Ke-5S
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 04:38:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Wfz-00078z-5T
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 04:38:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24009
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Wfz-00078h-2a
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 04:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582623530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9sbLDErYxFBZPgr9K1EjjlEla73hdaCPY1+7vMPL1c=;
 b=CXpRJL1uoYtVZ2SWPYxXXlg0KoWlWtH7rwkv1SLZ4h2yAkNMxzpg8fGtrjvmMfqKhaXJHF
 3ExyoJ4679l1ZgKVEqxSuSbz/h3KxGcaxYpzOF52BSmlQxbn1isqtcXDsT/Kla973dUuIj
 VF4oCf9ridjSh8biflMyaBwHAbl2gHE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-wC6kKUW2N32DmOCzn_OXlg-1; Tue, 25 Feb 2020 04:38:48 -0500
X-MC-Unique: wC6kKUW2N32DmOCzn_OXlg-1
Received: by mail-ed1-f70.google.com with SMTP id m21so8669083edp.14
 for <qemu-trivial@nongnu.org>; Tue, 25 Feb 2020 01:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W5I8Id1JlIHfrJIgv9AApiuVRbjXIZglHhMgGj8YuZU=;
 b=dhohVvxl5DSAXjWKdW/OpsTVjWX6eQo4FxxkusrV7YG+dJy4fndJNpme2UupG7pY+S
 cH+r7SiT0NyGtcUojv1c1oQAYxZfwm1vjtfsOcMM3ldJMRyh9IplXj3CVipv2+mnLEUf
 Nnv6AuFwBS901hygqac/pt6MslGMoObcGgPM+97eEpsPPavNMrv/fTo9ZP72LxSVf78h
 oFTx19zprIu1PFAEeLbYHhoo15boCqehdVpDd1R1Afezl8XX/bhC9NMfQap64JE+aOgL
 yBb2i/7LI6VBi6K1x9XqI9LzUQQlPRKvwG3Ao1Fj2G7zAbW3O2Z1JJdFev/fpzZtW6d3
 p55g==
X-Gm-Message-State: APjAAAXv1aOTMRTZYBKgO7d8NE4Jq3Tmmt7Wxzxw+gLCAT2dBxCz12OX
 b6Zvh8uYYwRypogGHUlbavL4taluh1oXOqy28JpCNBX4lXdZRYMX9CGlqWjWgCtn5y3TUqLCh8e
 aXX7Y0iAGR56aGHfeRw==
X-Received: by 2002:a17:906:2892:: with SMTP id
 o18mr53439924ejd.312.1582623527616; 
 Tue, 25 Feb 2020 01:38:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyYrTIIrMpE0Dh7xN8WojF+rd47ytoTkBeIkYUMWa4FcddZypaM8EFXwXCQ21jJtE4hCJ4Wcg==
X-Received: by 2002:a17:906:2892:: with SMTP id
 o18mr53439901ejd.312.1582623527379; 
 Tue, 25 Feb 2020 01:38:47 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id a14sm888272ejs.41.2020.02.25.01.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 01:38:46 -0800 (PST)
Subject: Re: [PATCH 12/13] usb/hcd-ehci: Remove redundant statements
To: kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 zhang.zhanghailiang@huawei.com
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
 <20200225020937.25028-13-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <56f0bc44-4096-bab8-0cd2-629add1d2299@redhat.com>
Date: Tue, 25 Feb 2020 10:38:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225020937.25028-13-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2020 09:38:53 -0000

On 2/25/20 3:09 AM, kuhn.chenqun@huawei.com wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
>=20
> The "again" assignment is meaningless before g_assert_not_reached.
> In addition, the break statements no longer needs to be after
> g_assert_not_reached.
>=20
> Clang static code analyzer show warning:
> hw/usb/hcd-ehci.c:2108:13: warning: Value stored to 'again' is never read
>              again =3D -1;
>              ^       ~~
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   hw/usb/hcd-ehci.c | 3 ---
>   1 file changed, 3 deletions(-)
>=20
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 56ab2f457f..29d49c2d7e 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -1301,7 +1301,6 @@ static void ehci_execute_complete(EHCIQueue *q)
>           /* should not be triggerable */
>           fprintf(stderr, "USB invalid response %d\n", p->packet.status);
>           g_assert_not_reached();
> -        break;
>       }
>  =20
>       /* TODO check 4.12 for splits */
> @@ -2105,9 +2104,7 @@ static void ehci_advance_state(EHCIState *ehci, int=
 async)
>  =20
>           default:
>               fprintf(stderr, "Bad state!\n");
> -            again =3D -1;
>               g_assert_not_reached();
> -            break;
>           }
>  =20
>           if (again < 0 || itd_count > 16) {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


