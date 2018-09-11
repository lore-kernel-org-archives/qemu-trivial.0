Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fzhLl-00031h-9i
	for mharc-qemu-trivial@gnu.org; Tue, 11 Sep 2018 08:00:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fzhLX-0002v1-EE
	for qemu-trivial@nongnu.org; Tue, 11 Sep 2018 08:00:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fzhLT-00034c-B1
	for qemu-trivial@nongnu.org; Tue, 11 Sep 2018 08:00:43 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34602)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fzhLT-00033W-2m; Tue, 11 Sep 2018 08:00:39 -0400
Received: by mail-wr1-x444.google.com with SMTP id g33-v6so25800075wrd.1;
	Tue, 11 Sep 2018 05:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=seYXQGE9851V6NG/eqeiLbcyOJW9jh925wf7Z/Ic9O8=;
	b=nS2xe+aZloVj3Zppd4a/lqnLGyWBYNugq/sI21Y0RDFcuOxftXbhJIK9s3Ps8qb2j5
	Xz0Kg8nOIAmLrSP++4FaoHmWO8rbt3mroEe4AyWYt4VJ/OoI2HElIk44/dN9XolnpNQy
	csiMBkHS5acxShP2G5vJB0tvdbCScGqGCgMXJnxfPnD9X1zibTgmsOhY/MF+OND7xtE9
	PWiDLIyXskQtqSvLb3f39N/dahWd0kp+eVDn00lQiYCMgzguHh6UX49X9IySij47RHPj
	IdJfJYPqV9V+/qU3Yb/1JaGI0hiLliS3qXLly0PL0heJ0jn4tOdZdhKTVaO4xH8jUTih
	L03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=seYXQGE9851V6NG/eqeiLbcyOJW9jh925wf7Z/Ic9O8=;
	b=R6IElEyBJKWiAZQHhoMfp1+40N6txwgsLvZwpKdPuPtcgoiZmoHXbJ9yF+73Ik4HM5
	uwpZlcTrbqmMiInI3sf6/q7IfOOGAFhZHlLq39VZ/KAbwE+NJZsxFhcFutS8pFsjaHRj
	PCCkh3IstwP372A4VMMWrU8I0+khMSzdjDjpl6xy15GKPKJjn9PVLJZiLW4/A+Xtomir
	TDbr9KDrc5uuH2SCFPqs8RBfnLywlzg+i4BHfjAxiglETky8JdwOUr0y+OolxUrluUV6
	gpY5VvMS73LjOAiAI5Y1rch46WFusJljZffZU5K5CzbE+Cp8hT+jBkkag5sSXw92MAvZ
	KEUg==
X-Gm-Message-State: APzg51BSBLRY65iqtNI55UIQ035WbUw34e+uHV0KUka4Vv90YAbQSJ7W
	aNbMj0CqXM5rxajMFqtMjxM=
X-Google-Smtp-Source: ANB0VdaaGv4hM8ZOcZT7YSkLWBTRRVCiQsyT9UpvdQ6pZOE+RhfyrQuK+gpCXh+QN5VxplN9JP6FiQ==
X-Received: by 2002:a05:6000:c:: with SMTP id
	h12mr19395198wrx.103.1536667237957; 
	Tue, 11 Sep 2018 05:00:37 -0700 (PDT)
Received: from [192.168.1.26] ([105.154.214.155])
	by smtp.gmail.com with ESMTPSA id
	t131-v6sm1441449wmg.10.2018.09.11.05.00.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 05:00:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
References: <1536566979-6868-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <45864da2-c372-a4ec-da97-512f946a3a5e@amsat.org>
Date: Tue, 11 Sep 2018 09:00:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1536566979-6868-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-trivial] [PATCH] hw/qdev-core: Fix description of
 instance_init
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
X-List-Received-Date: Tue, 11 Sep 2018 12:00:53 -0000

On 9/10/18 5:09 AM, Thomas Huth wrote:
> The part of the documentation of DeviceClass that talks about instance_init
> is partly wrong: instance_init() functions must not abort or exit, since
> the function is also called during introspection of the device already.
> So if a device calls exit() during its instance_init() function, QEMU
> terminates unexpectedly if somebody tries to just have a look at the
> interfaces from the device with "device_add xyz,help" or with the
> "device-list-properties" QOM command. This should never happen.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/qdev-core.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index f1fd0f8..a24d0dd 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -51,8 +51,9 @@ struct VMStateDescription;
>   * Devices are constructed in two stages,
>   * 1) object instantiation via object_initialize() and
>   * 2) device realization via #DeviceState:realized property.
> - * The former may not fail (it might assert or exit), the latter may return
> - * error information to the caller and must be re-entrant.
> + * The former may not fail (and must not abort or exit, since it is called
> + * during device introspection already), and the latter may return error
> + * information to the caller and must be re-entrant.
>   * Trivial field initializations should go into #TypeInfo.instance_init.
>   * Operations depending on @props static properties should go into @realize.
>   * After successful realization, setting static properties will fail.
> 

