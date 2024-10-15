Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t0cc0-0002we-N1
	for mharc-qemu-trivial@gnu.org; Tue, 15 Oct 2024 04:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1t0cbz-0002hJ-8F
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 04:08:59 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1t0cbw-0002NW-VG
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 04:08:59 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-430f6bc9ca6so39840345e9.2
 for <qemu-trivial@nongnu.org>; Tue, 15 Oct 2024 01:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728979735; x=1729584535; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUtD7kU+ZtH/ohs2DQUCU9xQr55ytexnezZMYgRtEBI=;
 b=kf9yR6glV0QyHP4tBmDMNy2o+vOyrU3a4MrXKuUyM26ixc77ZamxVbxYle0VPO4QQn
 oQm31j43WAwh3JOP3apm70ZLtrHqnB2x+B8bs0KlzwrTEPn232pSqEwDDLXoAH5BjzMx
 J6+sK9GymMhtBMSkHYRHQ9xkaQLR/AQZj9EANizznoPE5euznIZ3lxK6vmxjHbkFoaWu
 kThxc19eVMztaibzd9J+/vAXRLUwixO9tVRXGmzKL2QizXViQXnGEGIBUnf9dMN9C0Yg
 a+g9HBDbTPpX2SQ5fVgwvc0ksUNn0C/LTLw18PdRmk58SqsbW5I+THBmVvNtdsvLt/2c
 1ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728979735; x=1729584535;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oUtD7kU+ZtH/ohs2DQUCU9xQr55ytexnezZMYgRtEBI=;
 b=IUuWLJXxeUzFF/C68Ru2BOfkduErRwyhBVoZX2xldWFUfU+NzbjI0W4upAovL2vmmA
 alHr8yp924PP7KcH/9/E0myGr4p3F6S3mqXuE77O8gKYfUE3la0B56j9K+/ExOTehyLr
 pVbgHqmiUvrwBZw8gnh7Ft9k0kXIDmgkJA+StqXf9fnF1Bvec1eI+lF0N6i2QLrmKl7X
 77vSgtDmVMuQ7dMyySyzmdhmsjIsFCSvnovSYGh0HvxMhpWASzT0cLy4Avwdwq612MZs
 NbFYDpElzPNWQqpjtVcUxIIdbt09Pxulg17aqv8S4e3anD8tslkss1m6TCtK6QsU+24q
 bgxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6fQUmKFUm3B3GWIKlS4h9i14duDkZFYk/eeg1fVvUxhGmF4ZrFfidFC4I19d9QrmWb5Xv+/IpKv8qpgM=@nongnu.org
X-Gm-Message-State: AOJu0YzPD7uz63gsB9lzK+v4mh0Vhyjk6BEYx/yTAsNmlQTe6LtB3cF4
 C4LugzRqjru8o9xStU2cjRd5vXwNh+9KurUWOUCRtqfdmI4o7VAXrx926M18rgo=
X-Google-Smtp-Source: AGHT+IGSEpD8hGVmUhNErQXIbYOe6OexxGi5P5ucTKbmtDALY0nmRF75s8cOc/ApMjIVHy55XFlcOQ==
X-Received: by 2002:a05:600c:a10:b0:42c:af06:71b with SMTP id
 5b1f17b1804b1-4312560998bmr101178985e9.28.1728979734882; 
 Tue, 15 Oct 2024 01:08:54 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f6c767csm10047285e9.48.2024.10.15.01.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 01:08:54 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 903AC5F753;
 Tue, 15 Oct 2024 09:08:53 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org,  Brad Smith <brad@comstyle.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] ui/console-vc: Silence warning about sprintf() on OpenBSD
In-Reply-To: <67e2cb19-8de6-4ebf-ab4f-ae13b3de134d@tls.msk.ru> (Michael
 Tokarev's message of "Mon, 14 Oct 2024 22:50:44 +0300")
References: <20241014151023.85698-1-thuth@redhat.com>
 <Zw01n0A6xCG9mCm-@redhat.com>
 <67e2cb19-8de6-4ebf-ab4f-ae13b3de134d@tls.msk.ru>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Tue, 15 Oct 2024 09:08:53 +0100
Message-ID: <87ttddaiui.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Oct 2024 08:08:59 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> On 14.10.2024 18:15, Daniel P. Berrang=C3=A9 wrote:
>
>> These two lines are the only place in the code that uses the
>>     char response[40];
>> so even better than switching to snprintf, how about just taking
>> buffer size out of the picture:
>>    g_autofree *response =3D
>>        g_strdup_printf("\033[%d;%dR",
>>                        (s->y_base + s->y) % s->total_height + 1,
>>                        s->x + 1);
>>    vc_respond_str(vc, response);
>
> What's the reason to perform memory allocation in trivial places
> like this?  If we're worrying about possible buffer size issue,
> maybe asprintf() is a better alternative for such small things?
> Fragmenting heap memory for no reason seems too much overkill.
> But I'm old-scool, so.. :)

I doubt the allocate/free pair will cause much fragmentation but it
doesn't look like we are in any hot path here. Anyway snprintf is
certainly better than sprintf so:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> /mjt

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

