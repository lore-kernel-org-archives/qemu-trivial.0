Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hih8y-0000Ty-OO
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jul 2019 11:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40047)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hih8t-0000Ot-6v
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2019 11:25:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hih8r-0007eX-QK
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2019 11:25:55 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:44739)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1hih8m-0007b3-8j; Wed, 03 Jul 2019 11:25:48 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MStT6-1i6J3w0BHa-00UM6v; Wed, 03 Jul 2019 17:25:18 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Amit Shah <amit@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Date: Wed,  3 Jul 2019 17:25:12 +0200
Message-Id: <20190703152513.29166-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703152513.29166-1-laurent@vivier.eu>
References: <20190703152513.29166-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JcaF5sjwHTFCt7aHzuKIJ0KCl4QgWlIzcfph3RCg81DUWUmrX69
 eR8qDI9rxShWmJepn9PJthE1svivmyONywZACPDy+FTlpbOmnx0O3POyUfMmgmARr95lXZo
 zGrgJypDvtiDzJn4PJSTwF4VuK7m71jF9ISIpRibMf488EfO7etAu+xe6ZDKQVSicAMht6s
 oJjpetiF9bLXhiQjCYNlw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:74keQtL+OR8=:KBsknnQfnpANKM6ZOdFTXk
 so2pcTbNZab8lWa2zgjemHNvHFraTX3mkNj5Z9sQWw50l3u+DcLmQ84hqbhYQMGcpGZMnVDYH
 yK5oyKX6hkVRplIQVebNuAvsnEfMTsyXfPDMIlGf39+0S9hGKxDlWq8zYtadF6w8/9EC/FQg3
 q2QN+sSdF7yR2hK/9EDvYhCGjZ+blKylkw10nj63yn2+LsVIIle5Ul//Yv4nWCZRA9Q2+vi9x
 IVkWbLiDa8ydmUiacj66ux5naM+5ZQh2fpepjZSyCn74u1Neyna1QqAzmJ55M3JbF3K8O6E7k
 TQ5mqqv4pXNnyLpRRxyGrfKAepKhC8flqAN3+eG1FchFvDZbfd79Y5nlueBEBDT4MCO6ayK4z
 ZKYe+uFd0Y7XdOG14BH3eovnXk1IMTB7HFpRn4R2DVXm2r2rFcAQY9cr92dJzet0anWw5tXpt
 CNwF11Xzot3K2vPaiAzsD+4X+/AyLsqF9attxbGy+roM8TDZ1KrhT3lJ5Ajh42riJ/MZ090fR
 aVgS+sIimG/ckqFVpBr6SarVm+b4Nuz4j+5rkIPaMOg5yy8k++RO4tl3mPHNkaq0Yctms3tgZ
 C2rpAH06sGlKqFAQAc874EL1UbOT7TvVWPf7j+sxVFnIakwGTIwfdOlR4vzAW8gOX0ntwKUIR
 6qytn3at1IXi0mXX2Z9rucfqq53oCFWf7JFVmbrryBD5bBxhwui4zamuxUqG4Lh6SUPmlqVZc
 4Qgu/znARPVHZI+c7hadDwGR9676dGcyExOuq0K+t1GHZQCpIni6ARwg+GQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL v2 1/2] VirtIO-RNG: Update default entropy
 source to `/dev/urandom`
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
X-List-Received-Date: Wed, 03 Jul 2019 15:25:57 -0000

From: Kashyap Chamarthy <kchamart@redhat.com>

When QEMU exposes a VirtIO-RNG device to the guest, that device needs a
source of entropy, and that source needs to be "non-blocking", like
`/dev/urandom`.  However, currently QEMU defaults to the problematic
`/dev/random`, which on Linux is "blocking" (as in, it waits until
sufficient entropy is available).

Why prefer `/dev/urandom` over `/dev/random`?
---------------------------------------------

The man pages of urandom(4) and random(4) state:

    "The /dev/random device is a legacy interface which dates back to a
    time where the cryptographic primitives used in the implementation
    of /dev/urandom were not widely trusted.  It will return random
    bytes only within the estimated number of bits of fresh noise in the
    entropy pool, blocking if necessary.  /dev/random is suitable for
    applications that need high quality randomness, and can afford
    indeterminate delays."

Further, the "Usage" section of the said man pages state:

    "The /dev/random interface is considered a legacy interface, and
    /dev/urandom is preferred and sufficient in all use cases, with the
    exception of applications which require randomness during early boot
    time; for these applications, getrandom(2) must be used instead,
    because it will block until the entropy pool is initialized.

    "If a seed file is saved across reboots as recommended below (all
    major Linux distributions have done this since 2000 at least), the
    output is cryptographically secure against attackers without local
    root access as soon as it is reloaded in the boot sequence, and
    perfectly adequate for network encryption session keys.  Since reads
    from /dev/random may block, users will usually want to open it in
    nonblocking mode (or perform a read with timeout), and provide some
    sort of user notification if the desired entropy is not immediately
    available."

And refer to random(7) for a comparison of `/dev/random` and
`/dev/urandom`.

What about other OSes?
----------------------

`/dev/urandom` exists and works on OS-X, FreeBSD, DragonFlyBSD, NetBSD
and OpenBSD, which cover all the non-Linux platforms we explicitly
support, aside from Windows.

On Windows `/dev/random` doesn't work either so we don't regress.
This is actually another argument in favour of using the newly
proposed 'rng-builtin' backend by default, as that will work on
Windows.

    - - -

Given the above, change the entropy source for VirtIO-RNG device to
`/dev/urandom`.

Related discussion in these[1][2] past threads.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg08335.html
    -- "RNG: Any reason QEMU doesn't default to `/dev/urandom`?"
[2] https://lists.nongnu.org/archive/html/qemu-devel/2018-09/msg02724.html
    -- "[RFC] Virtio RNG: Consider changing the default entropy source to
       /dev/urandom"

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20190529143106.11789-2-lvivier@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 backends/rng-random.c | 2 +-
 qemu-options.hx       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/backends/rng-random.c b/backends/rng-random.c
index aa5b9285f04d..a81058139330 100644
--- a/backends/rng-random.c
+++ b/backends/rng-random.c
@@ -113,7 +113,7 @@ static void rng_random_init(Object *obj)
                             rng_random_set_filename,
                             NULL);
 
-    s->filename = g_strdup("/dev/random");
+    s->filename = g_strdup("/dev/urandom");
     s->fd = -1;
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 0d8beb4afdef..2aae19b0f925 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4328,7 +4328,7 @@ Creates a random number generator backend which obtains entropy from
 a device on the host. The @option{id} parameter is a unique ID that
 will be used to reference this entropy backend from the @option{virtio-rng}
 device. The @option{filename} parameter specifies which file to obtain
-entropy from and if omitted defaults to @option{/dev/random}.
+entropy from and if omitted defaults to @option{/dev/urandom}.
 
 @item -object rng-egd,id=@var{id},chardev=@var{chardevid}
 
-- 
2.21.0


