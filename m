Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7E6O-0002ue-DD
	for mharc-qemu-trivial@gnu.org; Thu, 27 Feb 2020 03:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60014)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7E6H-0002rD-FV
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 03:00:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7E6F-0003DA-So
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 03:00:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49845
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7E6D-00037i-WC
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 03:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582790447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yE5Hx1AAL7CADO7/zyb61bboxGgXJ6xNaPC5Q4+u9Pk=;
 b=TWdC7TZDE3JjiOW50BbOPVMMGqiQ+BK16lgtYWA0nDae79BsxMmOWPTkzGHO5JvONYndr7
 /COEjCK2WCYxWAK22OeDZnS3KeajwrUIP4TGTNEnD6bjbCqkFiLOgh73aUTOzayaFKTaCZ
 qb7ulQHG7e27wAL6Duj7+nZXHhE6oPI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-ju-EpPL1OY-kx5idDdCmxw-1; Thu, 27 Feb 2020 03:00:45 -0500
X-MC-Unique: ju-EpPL1OY-kx5idDdCmxw-1
Received: by mail-wr1-f71.google.com with SMTP id r1so946981wrc.15
 for <qemu-trivial@nongnu.org>; Thu, 27 Feb 2020 00:00:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f6hzv6RfxrfDmTJ9rzSurTVrY4zLOxvjt9xoWfKo82I=;
 b=U4DdkA9MlTRkBPEKjtShZtK0hj5jNX9bM1d2Ur88PnZwhCN5DJ2nA9YZJ3nAdyDr6s
 WTOLfcqCa1RHefvMts6Ybe3wirip+83Ot1qfQTakNGsQ7d9LVk0YLCmFXrwgQVVQUGFO
 wn1YrywBmCaS91PKkQYp/wER5WlsKnu+GjVl84eWX/ES9UtQwIxdoIOTd7tQ69npn+qx
 P0uP01/rB+xWKAC+X7l/5Bal/DsrAsEw5kPwrjtOOcqY6vXqir8HEQcknO5FkDn/Uplk
 VfesfSwfZF5ODkI3aSc+JRSu5G+Vs3QdjlNfu3FdZd85nZnvIFQysqgRKyrwScBzdRpc
 yofQ==
X-Gm-Message-State: APjAAAW95krkVq65Ig1p5NHRuYPEmS6fkJGO9AJtc/KS4l666T72L7bv
 ZpI9158VIE6MFiX6hKKiXI0Ah36GFe4w5+tOiDgi72LimHheFRlmwgdAtM0uW7JnZUggxtFHnHk
 t6wfVctnfl75+5dWWDg==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr3271725wrv.318.1582790443555; 
 Thu, 27 Feb 2020 00:00:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqy1QHnZsXTSRIqlYZKBJd1Bmmg/R1v5HUfMGJwmOB5fBHe8wSNODnppQ76DDB/Dxz7q+HlzFg==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr3271698wrv.318.1582790443304; 
 Thu, 27 Feb 2020 00:00:43 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id p15sm6393677wma.40.2020.02.27.00.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 00:00:42 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Add entry for Guest X86 HAXM CPUs
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Colin Xu <colin.xu@intel.com>, qemu-devel@nongnu.org, pbonzini@redhat.com
Cc: hang.yuan@intel.com, wenchao.wang@intel.com,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200226043204.67961-1-colin.xu@intel.com>
 <556a79eb-de83-0471-353f-b92423a77faa@redhat.com>
Message-ID: <7509aa5c-aa6f-14e0-e641-6e70731e59d9@redhat.com>
Date: Thu, 27 Feb 2020 09:00:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <556a79eb-de83-0471-353f-b92423a77faa@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Thu, 27 Feb 2020 08:00:58 -0000

On 2/27/20 8:56 AM, Philippe Mathieu-Daud=E9 wrote:
> Cc'ing qemu-trivial@
>=20
> On 2/26/20 5:32 AM, Colin Xu wrote:
>> HAXM covers below files:
>> include/sysemu/hax.h
>> target/i386/hax-*
>>
>> Cc: Wenchao Wang <wenchao.wang@intel.com>
>> Cc: Hang Yuan <hang.yuan@intel.com>
>> Signed-off-by: Colin Xu <colin.xu@intel.com>
>=20
> Please keep the Acked-by/Reviewed-by tags:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg623832.html
>=20
> This patch already has:
> Reviewed-by: Hang Yuan <hang.yuan@intel.com>
>=20
>> ---
>> =A0 MAINTAINERS | 10 ++++++++++
>> =A0 1 file changed, 10 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 36d94c17a654..27727e2fac13 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -435,6 +435,16 @@ F: include/hw/block/dataplane/xen*
>> =A0 F: include/hw/xen/
>> =A0 F: include/sysemu/xen-mapcache.h
>> +Guest CPU Cores (HAXM)
>> +---------------------
>> +X86 HAXM CPUs
>> +M: Wenchao Wang <wenchao.wang@intel.com>
>> +M: Colin Xu <colin.xu@intel.com>

Maybe you can also link where to report HAXM issues:

W: https://github.com/intel/haxm/issues

>> +L: haxm-team@intel.com
>> +S: Maintained
>> +F: include/sysemu/hax.h
>> +F: target/i386/hax-*
>> +
>> =A0 Hosts
>> =A0 -----
>> =A0 LINUX
>>


