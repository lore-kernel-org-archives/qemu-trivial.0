Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qp72y-0002nD-6j
	for mharc-qemu-trivial@gnu.org; Sat, 07 Oct 2023 09:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1qp2Hx-00007R-0f
 for qemu-trivial@nongnu.org; Sat, 07 Oct 2023 04:03:53 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1qp2Hu-00027Z-TC
 for qemu-trivial@nongnu.org; Sat, 07 Oct 2023 04:03:52 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-578b4997decso2202705a12.0
 for <qemu-trivial@nongnu.org>; Sat, 07 Oct 2023 01:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1696665824; x=1697270624; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RjwOSRl5Moe97C0ux5uWNNaZO5PoXf/S90zPpk4KeIU=;
 b=WA7lgiTZkqBmwzM7qOJJdOQGyQsBb4RH9O2QpcdHbaPPyy9bhxmLRB64DAUeaEEOai
 V3Impo2uwZeZlQ8vVZun0o4zIMeZiOWSFQZn10uDbQCxmgpsDBEdb2losIuCvbpR/M0P
 hu8/WK8uIB/mICq1a1/N1X3wIiLtiqcwyHbASAI4gdaVN5s/XI/ylM0C4Z8GiVwWDP2o
 8nb4VF/yYaBhS0Fki/XCUbXe5ilTXXNX0WzYKRsyAb2QI+gWcbttHFWqyhD4gtt/tJFK
 KaCxyWRpZTow+E3zDp3r11dO7a/UBsWudZOxU/aEuNO+jCg1iFasvT8RgEGOjrzhXyCN
 PBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696665824; x=1697270624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RjwOSRl5Moe97C0ux5uWNNaZO5PoXf/S90zPpk4KeIU=;
 b=iq9Sn0BBQHb3Kc5qXqT30uahkh5qBniLdLCQ7rEm81zsVCyC0/ksnKROSl+Ae8CgCf
 6VEyQvQAQrS67+tMPnE3s/5PvIr6y6BAyu7NvQQLFymgFnDxv+Gb2oTPoQF8qOdzdN+I
 lZk/RmIixxtynjtKeM8mxS8UoVAG/EObmK7vrHtrpLNOxUqX+WzVMfxOVZ3oqgvMP1hH
 /UT8m4FzYBgCHL7noFXjX5yDUPeJeCCLfH5RLbSLVeiheeeLJuYUaax1rBuYHwjGztjC
 qMqTCSUv8BPiqJZNya+3FQIhIEYyuN2z1mWbIJ5wloLnEsjqO36O6Ks9pn4ga3JVS8/g
 Z7Yg==
X-Gm-Message-State: AOJu0Yxe4Gz9dC/stS0jAC64VcPq3WS63tPUA2/npQPFQMJqVmrQwwxe
 bZxC8SLS9yedWMhVkygNl9bN+5k9PQzHSXbW2m6G
X-Google-Smtp-Source: AGHT+IFL/k6tUIxcQhSfIFVcdaGaXP0LEAAmdhZlqNDatTninRBuBOg4JgeZlmLhdGaYoN69pJsp9nSIDHOY3eVj1Jo=
X-Received: by 2002:a05:6a20:12c9:b0:15c:b7ba:6a4d with SMTP id
 v9-20020a056a2012c900b0015cb7ba6a4dmr12125143pzg.50.1696665823777; Sat, 07
 Oct 2023 01:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231006120819.480792-1-thuth@redhat.com>
In-Reply-To: <20231006120819.480792-1-thuth@redhat.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Sat, 7 Oct 2023 16:03:32 +0800
Message-ID: <CACycT3vRayGGP2TfN5=Gm+KOkvpfp6iypcQScnj6t1Hs7bJppg@mail.gmail.com>
Subject: Re: [PATCH] libvduse: Fix compiler warning with -Wshadow=local
To: Thomas Huth <thuth@redhat.com>
Cc: qemu devel list <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=xieyongji@bytedance.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 07 Oct 2023 09:08:42 -0400
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
X-List-Received-Date: Sat, 07 Oct 2023 08:03:53 -0000

On Fri, Oct 6, 2023 at 8:08=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrote=
:
>
> No need to declare a new variable with the same name here,
> we can simple re-use the one from the top of the function.
> With this change, the file now compiles fine with -Wshadow=3Dlocal.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Xie Yongji <xieyongji@bytedance.com>

Thanks,
Yongji

