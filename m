Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tX1pD-0007uU-Mb
	for mharc-qemu-trivial@gnu.org; Sun, 12 Jan 2025 12:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tX1p2-0007ti-NO
 for qemu-trivial@nongnu.org; Sun, 12 Jan 2025 12:32:25 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tX1p0-0000Sy-O4
 for qemu-trivial@nongnu.org; Sun, 12 Jan 2025 12:32:24 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43623f0c574so25400935e9.2
 for <qemu-trivial@nongnu.org>; Sun, 12 Jan 2025 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736703140; x=1737307940; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1UVOydxaBftTDJA9IS2xai9YhUYwPPnbCWE3Z0cGEos=;
 b=mwdMb+5cvvRlk7sfByOtKkS5DgMoxxPSK2I52vgqNv6Jwk0rLOsEehwQv/3vyfa6UO
 oQDf7I3+TFhxJ69yWZp/9vlEtErj06IvqOtBTX0u16htjp2eIMue6LrhN2pn5LTrPpgR
 VHsptFBPkoyFHmYurcAhQKDnokJn0DO6m/+iA5hU4mHNqkXWj8Ak68A3IwU+65P6sHhm
 LT5voxc/BvjpZv4lyjBH4b5qDI00ta67+5mjmbc+WN0Y31luk+QDy3Ze0GAXGKhLcbKJ
 R+3EFpGZRPJKZV/wMjVdqKTKD1QnDeX1cj0ZI6wQGvXJv8C58bV7Y63r2DttGI/jSdaY
 h72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736703140; x=1737307940;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1UVOydxaBftTDJA9IS2xai9YhUYwPPnbCWE3Z0cGEos=;
 b=by4FRh5vYy1RNONWd5PoHjc/BWDy28/DmdokQah+HjMPRbRJv+L0jqHt2T7m1V4H1d
 XAxa4y9A+exhEr4Wzjby7iJqgEhOzFtWxNECwQ5+taS00C514FHB8k2uPHn0nPvA6q6f
 81ekkVvoBcqyLDrv25kI3OQbzCVRX6ZxXRziuC4R4Scz80xCeynieKwELoV281ebwTwY
 LZZ+gCtURd8k3FYQQHOXmG4NWXLtFozCP0inZ6IcW1wgwrU9jQ4yx0jRWyc+tOavJs3q
 4rss804ZG6Dxy4wLEHpWMx/fcR6n8JRhXOnY1pzmJB+YQcEN1nIYBh3qD0Zw2HHKFaoj
 LR7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUghVvelH7ItdopDuG21n9+AbU5qq2ZGJmk3Akc6QmBM6YoCI22h/T/INPtH5+Ri6bORLvvqkFswRxX7c=@nongnu.org
X-Gm-Message-State: AOJu0YzxL03fa2PFGeTZsr7HZ/pQzhoED4Kf+ldj38VJKd9xWAdZBmMJ
 S2OvTFgMMn7wk6GPNv8qGPyRopa+NlE5JFAEZ8fEw2s76NLknj+IwGP5bqT7KNA=
X-Gm-Gg: ASbGncsPf4BjU3HfCWxCJZZ62EloUTgXL6D9g70RC4TeEB70xUdHnngS32x/z3joqCB
 Q1ZzIZfsl5vErbhcm4xw7/RMgx+lw6wbNUqo8A6d+WWLZifMjPdTPYBzKS3pmv/1kAXZoolLX/7
 /Q1B5+9S2BMTHH7eK2gPKizLCt0uDeGUpDRyWK3h3nSCn6uV0ToXZ/OgL1T4o9GNJsYv1OjoVDp
 3cO6XLOn2igwl6aRg6WSYVfHn5VPiZ26W3Xrz7Ria0xXyXHd+uoAX+UhKhL/gHefSzCEo7Z7UYM
 Mpx2ciXSB0AUn28Mg8kyp2Rm
X-Google-Smtp-Source: AGHT+IHFUTM6Id7P83aAS9QsAOgf/6TcYIGBszhhu24Fer1eQ2bzoQTEREuq0Fh997gB7OtcN0QBiQ==
X-Received: by 2002:a5d:6d87:0:b0:385:ef2f:92ad with SMTP id
 ffacd0b85a97d-38a872f7f80mr15690677f8f.10.1736703140233; 
 Sun, 12 Jan 2025 09:32:20 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e383dedsm10266969f8f.35.2025.01.12.09.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jan 2025 09:32:19 -0800 (PST)
Message-ID: <dd12a227-0990-42b7-b241-301bca90915c@linaro.org>
Date: Sun, 12 Jan 2025 18:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/nsis.py: Run dependency check for each DLL file
 only once
To: Stefan Weil <sw@weilnetz.de>, Bin Meng <bin.meng@windriver.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250111215244.1680931-1-sw@weilnetz.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250111215244.1680931-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Sun, 12 Jan 2025 17:32:28 -0000

On 11/1/25 22:52, Stefan Weil via wrote:
> Each DLL should only be checked once for dependencies, but
> several hundred (781 in my test) unneeded checks were done.
> 
> Now the script is significantly faster (16 s in my build).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   scripts/nsis.py | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index d0914c88a7..d0ac61f6ab 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -37,10 +37,10 @@ def find_deps(exe_or_dll, search_path, analyzed_deps):
>   
>           analyzed_deps.add(dep)
>           # locate the dll dependencies recursively
> -        rdeps = find_deps(dll, search_path, analyzed_deps)
> +        analyzed_deps, rdeps = find_deps(dll, search_path, analyzed_deps)
>           deps.extend(rdeps)
>   
> -    return deps
> +    return analyzed_deps, deps
>   
>   def main():
>       parser = argparse.ArgumentParser(description="QEMU NSIS build helper.")
> @@ -92,18 +92,18 @@ def main():
>           dlldir = os.path.join(destdir + prefix, "dll")
>           os.mkdir(dlldir)
>   
> +        analyzed_deps = set()
>           for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
>               signcode(exe)
>   
>               # find all dll dependencies
> -            deps = set(find_deps(exe, search_path, set()))
> +            analyzed_deps, deps = find_deps(exe, search_path, analyzed_deps)
> +            deps = set(deps)
>               deps.remove(exe)
>   
>               # copy all dlls to the DLLDIR
>               for dep in deps:
>                   dllfile = os.path.join(dlldir, os.path.basename(dep))
> -                if (os.path.exists(dllfile)):
> -                    continue
>                   print("Copying '%s' to '%s'" % (dep, dllfile))
>                   shutil.copy(dep, dllfile)
>   

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


