Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEYk-0002H6-9L
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYh-0002Gx-Ob
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYf-0002c6-Nx
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:47:59 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:38971)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYf-0002Ox-A1; Thu, 14 Feb 2019 05:47:57 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MOAJt-1giuno3dWL-00OV8J; Thu, 14 Feb 2019 11:47:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org, libvir-list@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu, 14 Feb 2019 11:47:07 +0100
Message-Id: <20190214104717.3543-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FmmfoOelMXqUzvgQsrVszvn6/zKDiCufRwYfyb+DICJPCQNBHQL
	kvc2R81pW4ZFGJ9hXekaLa9RR+JQ/F1Vh7VZARq8z2Yj/7DIOl7FSDwT1AwrfxewuC2avSr
	5LXdBG6sR9kRvmp3U4g7wu8s6fKhvvfRxth9HhRkqe2rdL4yuolrlFSsDKhX5kpimjjat32
	8tOtCZslhxYwMl01K+tKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VANOha2S0q8=:qiBkKT13CfCu3HdYBV9baI
	XwHRSG0GhQFMxnkFOGb5MNq966CAOVxK836j8JMUDyXtubnsfrfhBfYa3nhpohE/iUF1BmsWX
	8HGSQDDClJpFFVirOnydbtFaoBoq+hWvZa/M9SOjoZ7CVcnbt/G9KamGFgfal1d3uHb412tzn
	pUQtUCH0B+LU5P3lvyrh9KEAxm9jkrZ32EDA54neU2xMw4Pt8aUSrVhT7LDN4ycNvy7yW/Gao
	/l+y/ANfJZ9Aj0oIPU8XvmvUGgYAVGxh8Qd/myoYA2uno7DdhtAyi67syx9JadbpnWGWR/WKq
	cRo7+1KlE1uerWQiXx97TIS056zkJasnja92IPdIF6v0HGllOu5CPZESqT2p4YT9lQXFL4k5E
	f2iL+azt15Gqs2Fdl0fjHhSS2SNvtt3FrK8HErdPoIJQcuk+oveHS8LuC6tj998tqtz8cxBTe
	FnPWlKfqQEkPTLWL+f+YeUIaBKyegfXmwDD67IV0NODoGU18cRNF9f1DuIVZlkX+OAjIDXWkX
	EdK/xxZi7OQpfcRIjWOJXxLXFRSimFjnRlT6R6Fn+hycqXLgdqudMclwZMT0J19LyjGq6Dh6D
	7J3FH4jCmev3pc6xjQyM1lwMYd40NaMfz1YJc/2Oe+Rg2xKvpqlMjrSwznZjR85BpSv075QOs
	A9u1tFod7XX/3Su6zsS/vdmPjV+romqTzu58/3Q+aiBD8/7uWnoRh5wEc26h2DdGBnFbrnzQH
	UX6S2OKCcZGplw5l+nZ8KN3V8HVyzxL4qUTqOCXHshcppoiqIwpn1jD1XZg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL 04/14] configure: remove handling of "wav"
 audio driver
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:00 -0000

From: Cleber Rosa <crosa@redhat.com>

This looks like a leftover that was never implemented.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190207193605.25676-2-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configure b/configure
index fbd0825488c6..ff55e2273e9a 100755
--- a/configure
+++ b/configure
@@ -3350,10 +3350,6 @@ for drv in $audio_drv_list; do
       oss_libs="$oss_lib"
     ;;
 
-    wav)
-    # XXX: Probes for CoreAudio, DirectSound
-    ;;
-
     *)
     echo "$audio_possible_drivers" | grep -q "\<$drv\>" || {
         error_exit "Unknown driver '$drv' selected" \
-- 
2.20.1


