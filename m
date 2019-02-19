Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwDbG-0000v5-GA
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 17:10:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gwDbE-0000V5-9Z
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 17:10:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gwDTw-0002TL-Ej
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 17:03:18 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:41747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1gwDTs-00027N-6n; Tue, 19 Feb 2019 17:03:12 -0500
Received: by mail-ed1-x541.google.com with SMTP id x7so18126285eds.8;
	Tue, 19 Feb 2019 14:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=CdvrOKqF/VdSub6a48SrsOVhU4vQkGhwxL6/SiwN+cA=;
	b=SQ7bLbw9t/4enaDOQ0kfLAzE7NcVGgy3TobHQQ1EhQMpoT6FRfsWvWuM8E0ATzjqVZ
	HNcjcjf4SOKJ1Yfo0DskiTrA9hiXe+XWJ+J3rOccBOxDOdqNhYuKdlHGLEfskxHduTUi
	cxT36m/aE76eiy+neKK0zGqnL39Lo5bDovVU7iYyEFMr9e6Gea244yXBfC5ORWAC3xHU
	6VKVIzCsCRm/+YWAcqUe9TD+1HRM2XTjwnjOHU9bvL4YJsDy2wJjkFFomwpXaK/D3THj
	reok1Hkq/TDcbefJWlvvIwI1WyJec40Qfbv7qR50tXVRYtE3SR+xVTLw9kim0bEoEU33
	q4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=CdvrOKqF/VdSub6a48SrsOVhU4vQkGhwxL6/SiwN+cA=;
	b=okw/g9CgnAOVnbJrIpTIGcaozFqhwvX8tnKsxc/AStaMKdPnnEJrBMJO71aLJVhY4r
	hSF83WAUbbmSdGlj/TFirj8LvaoX6XzW8SZrL9PDNGkH7uqEQGKsL2u9yDJyYKOE5HMW
	sedHTyo3hLZK8LA3+7QA2JG3EbKqJjf/STkzeeuKvVYhsrjqzL8RmW48UFO6aKc/gtd0
	53lp2+MfhyTVwknWFQo0krDMAAO9r5NK7/+d+U+TVyriw32k43gYmL7KH+BqKpvV6oTm
	52fWhkxTJLoIISkx/mz1Q3KXSRzX0BYqqaxQnaiuHm+HepvlzkRfDeDrNh+Ue9Kn0gWB
	RNVA==
X-Gm-Message-State: AHQUAuYJrAwX9Ekt0bUDQTxO1JyZTR8vLDHenWoOBZLaVPzDrdX18p1q
	AQdS67kP3Ja/7LV1VS2WgL0=
X-Google-Smtp-Source: AHgI3IYgxBYt/BOqHbUp4V3mezxcZ3M3IiB4d6NAc5ylEMdgELu6aqQJXqLOYCBvWck5eH7dxGOk2g==
X-Received: by 2002:a17:906:8cf:: with SMTP id
	o15mr22285551eje.124.1550613786395; 
	Tue, 19 Feb 2019 14:03:06 -0800 (PST)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
	gf3sm3926558ejb.51.2019.02.19.14.03.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 14:03:05 -0800 (PST)
Date: Tue, 19 Feb 2019 22:03:04 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	imammedo@redhat.com, mjt@tls.msk.ru
Message-ID: <20190219220304.6mtpg44yry252glj@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
	<20190219013106.17538-2-richardw.yang@linux.intel.com>
	<e59b0920-4698-a0d1-7990-77d9e2202f9b@redhat.com>
	<83037dad-5d57-2ebd-0038-27dd38975d3f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83037dad-5d57-2ebd-0038-27dd38975d3f@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] CODING_STYLE: specify
 the indent rule for multiline code
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
X-List-Received-Date: Tue, 19 Feb 2019 22:10:49 -0000

On Tue, Feb 19, 2019 at 11:55:04AM -0600, Eric Blake wrote:
>On 2/19/19 11:34 AM, Philippe Mathieu-Daudé wrote:
>
>> 
>> What is still unclear is what to do when a function name is over 60
>> characters (you follow a library/API and can not shorten it), for example:
>> 
>> static void ccid_card_vscard_handle_message(PassthruState *card,
>>     const VSCMsgHeader *scr_msg_header);
>> 
>> What is the project guideline in this case?
>
>I don't know that we have an official guideline, but I've seen enough
>code doing that. I've also seen this style:
>
>static void long_func_name(
>    parameter one, parameter two)
>{
>    if (condition) {
>        call_some_really_long_name(
>            arg1,
>            arg2);
>    }
>
>where even the first argument is put at an indentation of 4 from the
>primary line.

We should put this style in the example too?

>
>-- 
>Eric Blake, Principal Software Engineer
>Red Hat, Inc.           +1-919-301-3226
>Virtualization:  qemu.org | libvirt.org

-- 
Wei Yang
Help you, Help me

