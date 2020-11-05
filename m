Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kacdj-0000Ye-SM
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2020 05:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kacdi-0000Y4-8y
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 05:37:10 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kacdg-0006Y8-Kj
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 05:37:09 -0500
Received: by mail-wr1-x444.google.com with SMTP id 33so1140966wrl.7
 for <qemu-trivial@nongnu.org>; Thu, 05 Nov 2020 02:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=dbwsPypmmUiKjy7BxOBscuZfezC/mOC0uTFc2KwwLI8=;
 b=wBN0PfaNnsPa1ijlzNlj0EJA9gcx3sGNczEeNzY9tQWa0YZOsmv1Aa6LYtuJH7Tjcx
 jPZYc3MQ+H73HmIH3s07oK+kJBP5RWoQKfOd9wI+CvOqC1hcsSR4tr4Lcv5Xs5vpWf4+
 XIPjRyyXRcoWTyiLDEaYepvtzPCQbJXGTtOCAFgx5xNL/0e828c3f92LeheWyiRWNfDn
 fYWaaVo02fIWMcaQ8kGelmSYnG+Tc+bfQkJN+wzAqRYdQdjl65nvuj6fGQ8UcbIKIC8H
 5b0rNT8NX3HrmHfj1kugUFeNqbv4aZ8C1fpk5IV4zNKlZxI49xEC3n0h90jjEx8sVJM+
 W4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=dbwsPypmmUiKjy7BxOBscuZfezC/mOC0uTFc2KwwLI8=;
 b=OLpvpIMgwuC5BHRRuhM73JDFaBpEY7VA0O1WIUIv2qu7fcz0D+fTfUeq/tWi3q7l1l
 9+mx+EQRGu6R6WweK3Rxo3nx7OgjcnJxk4l7+Xf9K0DrCylirP8rKZOaSYRnilfGJiVB
 bdQIJqEsCupte7fWZiGt1ugYh3hUdVk9eedQcKJMpKWL4Dd5EvGoX69LbsYHVo/CtcVd
 QfcY+aQl6v8BteiONN2HE/xA+PLfUSufSQ9EgO1+iKVOSbr96nZqDZROHx5VP5WimvIR
 G7eSB1WQEZc+aj1zFomMmsFSPz5In0iHRUnxAe7RVp3E9bbC4rgLrfzYv9L/vrKQVYiu
 dW8g==
X-Gm-Message-State: AOAM5306c680rerHEbsfaxgTNpltwOLdC486TJ/M4BNk9ZEdfvAJNpt5
 acF72rExzK/uVGZlMN90GF8cCg==
X-Google-Smtp-Source: ABdhPJxi7T/2JRVVAwEZo5qR3+iSWBVoENKOTuFPkJgBhCV+QFwKd8VzV4viqP4jhhMd4yT3umuwXQ==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr2026644wrj.328.1604572626707; 
 Thu, 05 Nov 2020 02:37:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c64sm1940276wmd.41.2020.11.05.02.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 02:37:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91D051FF7E;
 Thu,  5 Nov 2020 10:37:04 +0000 (GMT)
References: <5F9975E7.6030509@huawei.com> <5FA3A17C.30108@huawei.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: AlexChen <alex.chen@huawei.com>
Cc: mjt@tls.msk.ru, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 zhang.zhanghailiang@huawei.com, zhengchuan@huawei.com
Subject: Re: [PATCH 1/2] plugins: Fix resource leak in connect_socket()
In-reply-to: <5FA3A17C.30108@huawei.com>
Date: Thu, 05 Nov 2020 10:37:04 +0000
Message-ID: <87ft5oay3z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 05 Nov 2020 10:37:10 -0000


AlexChen <alex.chen@huawei.com> writes:

> Kindly ping.

Ahh sorry I missed these. Was there a cover letter for the series?

>
> On 2020/10/28 21:45, AlexChen wrote:
>> Close the fd when connect() fails.
>>=20
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: AlexChen <alex.chen@huawei.com>
>> ---
>>  contrib/plugins/lockstep.c | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
>> index a696673dff..319bd44b83 100644
>> --- a/contrib/plugins/lockstep.c
>> +++ b/contrib/plugins/lockstep.c
>> @@ -292,6 +292,7 @@ static bool connect_socket(const char *path)
>>=20
>>      if (connect(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)) < 0=
) {
>>          perror("failed to connect");
>> +        close(fd);
>>          return false;
>>      }
>>=20


--=20
Alex Benn=C3=A9e

